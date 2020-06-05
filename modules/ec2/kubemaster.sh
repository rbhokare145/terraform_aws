#!/bin/bash

# To set up variable

read -p "Enter the KubeNetwork CIDR range [10.244.0.0/16] : " networkrange

read -p "Enter the KubeMaster static private ip : " kubemasterip


# To initiate kubeadm and fannel

if [ ! -z ${networkrange} ] && [ ! -z ${kubemasterip} ];then

    # --ignore-preflight-errors=NumCPU : needed as I am using free tier node, take away this argument incase of heavy instance type.

     sudo kubeadm init --pod-network-cidr=${networkrange} --apiserver-advertise-address=${kubemasterip} --ignore-preflight-errors=NumCPU

fi

# To start using your cluster, you need to run the following as a regular user:


if [ ! -d $HOME/.kube ];then

    mkdir -p $HOME/.kube
    sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
    sudo chown $(id -u):$(id -g) $HOME/.kube/config

    # To install POD network and setup CoreDNS Pod and other key object of the cluster
    sudo kubectl apply -f https://raw.githubusercontent.com/coreos/flannel/2140ac876ef134e0ed5af15c65e414cf26827915/Documentation/kube-flannel.yml

    export TOKEN_NAME=$(kubeadm token list | awk '{print $1}' | grep -v "TOKEN")
    echo "TOKEN_NAME: $TOKEN_NAME"

    export CA_CERT=$(openssl x509 -pubkey -in /etc/kubernetes/pki/ca.crt | openssl rsa -pubin -outform der 2>/dev/null | openssl dgst -sha256 -hex | sed 's/^.* //')

    echo "CA_CERT: $CA_CERT"

fi
