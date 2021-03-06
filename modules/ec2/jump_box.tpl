#!/bin/bash

# To install docker

sudo apt-get update
sudo apt-get install -y apt-transport-https
sudo apt-get install -y ca-certificates
sudo apt-get install -y gnupg-agent
sudo apt-get install -y software-properties-common
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository  "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt-get update
sudo apt-get install -y docker-ce=17.03.3~ce-0~ubuntu-xenial
sudo apt-get install -y dos2unix

# To install kube tools

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl

# To install kubectx, kubens helm
cd /home/ubuntu && sudo git clone https://github.com/ahmetb/kubectx.git && sudo chown -R ubuntu:ubuntu kubectx
sudo export PATH=$PATH:/home/ubuntu/kubectx/

# To install helm

sudo curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash

# To clone terraform_aws
cd /home/ubuntu && sudo git clone https://github.com/rbhokare145/terraform_aws.git && sudo chown -R ubuntu:ubuntu terraform_aws/




