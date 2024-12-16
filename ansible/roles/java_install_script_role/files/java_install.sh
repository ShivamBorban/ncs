#!/bin/bash
set -e 

INSTALL_DIR=$1
VERSION=${2:-"22"}
SUBVERSION=${3:-"22.0.2"}

if [ $# -lt 1 ]; then
    echo "Error: Missing installation directory."
    echo "Usage: $0 <installation_directory> [java_version] [java_subversion]"
    exit 1
fi

if [ -d "${INSTALL_DIR}/jdk-${SUBVERSION}" ]; then
    echo "Java VERSION ${SUBVERSION} already exists in the specified directory."
    exit 0
fi

echo "Creating installation directory: ${INSTALL_DIR}"
mkdir -p "${INSTALL_DIR}"
cd "${INSTALL_DIR}"  

wget https://download.oracle.com/java/${VERSION}/archive/jdk-${SUBVERSION}_linux-x64_bin.tar.gz

tar -xvzf jdk-${SUBVERSION}_linux-x64_bin.tar.gz
rm -f "jdk-${SUBVERSION}_linux-x64_bin.tar.gz"

update_bashrc() {
    local export_line="$1"
    grep -q "$export_line" ~/.bashrc
}

if update_bashrc "export JAVA_HOME="; then
    sed -i "s|export JAVA_HOME=.*|export JAVA_HOME=${INSTALL_DIR}/jdk-${SUBVERSION}|g" ~/.bashrc
    echo "Replaced existing JAVA_HOME"
else
    echo "export JAVA_HOME=${INSTALL_DIR}/jdk-${SUBVERSION}" >> ~/.bashrc
    echo "Added JAVA_HOME"
fi

if update_bashrc "JAVA_HOME/bin"; then
    echo "Java PATH is already set in ~/.bashrc. Skipping..."
else
    echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc
    echo "Added the PATH"
fi

source ~/.bashrc
java -version
which java

unset INSTALL_DIR
unset VERSION
unset SUBVERSION

echo "Java installation completed successfully!"