#!/bin/bash
sudo yum install kubectl curl wget tinyproxy postgresql* git -y 
sudo systemctl start tinyproxy 
sudo systemctl enable tinyproxy
wget https://get.helm.sh/helm-v3.6.0-linux-amd64.tar.gz
tar xvf helm-v3.6.0-linux-amd64.tar.gz 
sudo mv linux-amd64/helm /usr/local/bin
rm helm-v3.6.0-linux-amd64.tar.gz