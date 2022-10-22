#!/bin/bash

echo "This script is to install jenkins"

echo "Step is to install java"
sudo yum install java-11-openjdk-devel -y
if [ $? -eq 0 ] 
then
    echo "Java well installed"
else
    echo "Java not installed"
    exit 1
fi

echo "Step 2: Enable the Jenkins repository"
curl --silent --location http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo | sudo tee /etc/yum.repos.d/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key

echo "Step 3: Install the latest stable version of Jenkins"
sudo yum install jenkins -y
if [ $? -eq 0 ] 
then
    echo "Jenkins well installed"
else
    echo "Jenkins not installed"
    exit 1
fi
sudo systemctl start jenkins
sudo systemctl status jenkins | grep running
if [ $? -eq 0 ] 
then
    echo "Jenkins is running"
else
    echo "Jenkins not inactive"
    exit 1
fi

sudo systemctl enable jenkins

echo "Step 4: Adjust the firewall"
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp
sudo firewall-cmd --reload

echo "Jenkins is ready please get ip and type it on your browser"
