#!/bin/bash

INSTALL_DIR=$1
ver=$2
subver=$3

echo "Enter the installation directory (absolute path):${INSTALL_DIR}"
echo "Enter Your JAVA Version: ${ver} and ${subver}"

if [ -d "${INSTALL_DIR}/jdk-${subver}" ]; then
    echo "Java version ${subver} already exists in the specified directory."
    exit 0
fi


echo "Creating installation directory: ${INSTALL_DIR}"
mkdir -p "${INSTALL_DIR}"
cd "${INSTALL_DIR}"

wget https://download.oracle.com/java/${ver}/archive/jdk-${subver}_linux-x64_bin.tar.gz

tar -xvzf jdk-${subver}_linux-x64_bin.tar.gz

echo "Updating environment variables..."
echo "export JAVA_HOME=${INSTALL_DIR}/jdk-${subver}" >> ~/.bashrc
echo "export PATH=\$JAVA_HOME/bin:\$PATH" >> ~/.bashrc
source ~/.bashrc

java -version

echo "Java installation completed successfully!"
