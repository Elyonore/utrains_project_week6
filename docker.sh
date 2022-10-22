#!/bin/bash

echo "Uninstall old versions"
sudo yum remove -y docker \
                  docker-client \
                  docker-client-latest \
                  docker-common \
                  docker-latest \
                  docker-latest-logrotate \
                  docker-logrotate \
                  docker-engine
echo "Set up the repository"
sudo yum install -y yum-utils
sudo yum-config-manager \
    --add-repo \
    https://download.docker.com/linux/centos/docker-ce.repo

echo "Install Docker Engine"   
sudo yum install -y docker-ce-18.09.1 docker-ce-cli-18.09.1 containerd.io docker-compose-plugin
if [ $? -eq 0 ] 
then
    echo "Docker well installed"
else
    echo "Docker not installed"
    exit 1
fi

sudo systemctl start docker
sudo docker run hello-world
