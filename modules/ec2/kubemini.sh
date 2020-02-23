#!/bin/bash

read -p "Enter the KubeMaster static private ip : " kubemasterip
read -p "Enter the token_name : " token
read -p "Enter the ca_cert : " ca_cert

if [ ! -z ${token} ] && [ ! -z ${ca_cert} ] && [ ! -z ${kubemasterip} ];then
    sudo kubeadm join --token "${TOKEN_NAME}" ${kubemasterip}:6443 --discovery-token-ca-cert-hash sha256:"${CA_CERT}"
fi
