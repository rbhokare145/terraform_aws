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

# To install kubelet, kubectl , kubeadm

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
cat <<EOF | sudo tee /etc/apt/sources.list.d/kubernetes.list
deb https://apt.kubernetes.io/ kubernetes-xenial main
EOF

sudo apt-get update
sudo apt-get install -y kubelet kubeadm kubectl


# To init kubeadm and fannel
# --ignore-preflight-errors=NumCPU : needed as I am using free tier node, take away this argument incase of heavy instance type.


sudo kubeadm init --pod-network-cidr=10.244.0.0/16 --apiserver-advertise-address=$$ {kubemasterip} --ignore-preflight-errors=NumCPU


# To start using your cluster, you need to run the following as a regular user:

mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# To install POD network and setup  CoreDNS Pod and other key object of the cluster
sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/2140ac876ef134e0ed5af15c65e414cf26827915/Documentation/kube-flannel.yml

#export TOKEN_NAME=$(kubeadm token list | awk '{print $1}' | grep -v "TOKEN")
#echo "TOKEN_NAME: $TOKEN_NAME"

#export CA_CERT=$(openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //')

#echo "CA_CERT: \$CA_CRT"
