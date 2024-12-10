#!/bin/bash

# Install java 
if java -version 2>&1 | grep -q "openjdk version \"17"; then
    echo "Java 17 is already installed. Skipping installation."
else
    echo "Java 17 is not installed. Proceeding with installation..."
    sudo apt update
    sudo apt install -y fontconfig openjdk-17-jre
    
    if java -version 2>&1 | grep -q "openjdk version \"17"; then
        echo "Java 17 installed successfully."
    else
        echo "Failed to install Java 17."
        exit 1
    fi
fi

# Function to check if Jenkins is installed
is_jenkins_installed() {
    systemctl list-units --type=service | grep -q "jenkins.service"
}

# Check if Jenkins is already installed
if is_jenkins_installed; then
    echo "Jenkins is already installed and configured. Skipping installation."
else
    echo "Jenkins is not installed. Proceeding with installation..."
    
    sudo wget -O /usr/share/keyrings/jenkins-keyring.asc https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
    echo "deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] https://pkg.jenkins.io/debian-stable binary/" | sudo tee /etc/apt/sources.list.d/jenkins.list > /dev/null

    sudo apt update
    sudo apt install -y jenkins
    
    sudo systemctl enable jenkins
    sudo systemctl start jenkins

    # Verify if Jenkins was successfully installed
    if is_jenkins_installed; then
        echo "Jenkins installed and started successfully.
        "
    else
        echo "Failed to install Jenkins."
        exit 1
    fi
fi

sudo systemctl status jenkins --no-pager

echo "Jenkins installation completed. Initial Admin Password:
"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword

