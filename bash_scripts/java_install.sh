#!/bin/bash

set -e
set -u
set -x

INSTALL_DIR=$1
VERSION=${2:-"22"}
SUBVERSION=${3:-"22.0.2"}

if [ $# -lt 1 ]; then
    echo "Error: Missing installation directory."
    echo "Usage: $0 <installation_directory> [java_version] [java_subversion]"
    exit 1
fi

echo "Enter the installation directory (absolute path):${INSTALL_DIR}"
echo "Enter Your JAVA VERSION: ${VERSION} and ${SUBVERSION}"

if [ -d "${INSTALL_DIR}/jdk-${SUBVERSION}" ]; then
    echo "Java VERSION ${SUBVERSION} already exists in the specified directory."
    exit 0
fi

echo "Creating installation directory: ${INSTALL_DIR}"
mkdir -p "${INSTALL_DIR}"
cd "${INSTALL_DIR}"  

wget https://download.oracle.com/java/${VERSION}/archive/jdk-${SUBVERSION}_linux-x64_bin.tar.gz

tar -xvzf jdk-${SUBVERSION}_linux-x64_bin.tar.gz


# Replace existing JAVA_HOME if present, or add a new one
if grep -q "export JAVA_HOME=" ~/.bashrc; then
    # Update the existing JAVA_HOME
    sed -i "s|export JAVA_HOME=.*|export JAVA_HOME=${INSTALL_DIR}/jdk-${SUBVERSION}|g" ~/.bashrc
    echo "Updated JAVA_HOME to ${INSTALL_DIR}/jdk-${SUBVERSION} in ~/.bashrc."
else
    # Add JAVA_HOME if it doesn't exist
    echo "export JAVA_HOME=${INSTALL_DIR}/jdk-${SUBVERSION}" >> ~/.bashrc
    echo "Added JAVA_HOME to ~/.bashrc."
fi


# Check if PATH is already set for Java
if ! grep -q "JAVA_HOME/bin" ~/.bashrc; then
    echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc
else
    echo "Java PATH is already set in ~/.bashrc. Skipping..."
fi

source ~/.bashrc



rm -f "jdk-${SUBVERSION}_linux-x64_bin.tar.gz"

java -version

unset INSTALL_DIR
unset VERSION
unset SUBVERSION

echo "Java installation completed successfully!"
