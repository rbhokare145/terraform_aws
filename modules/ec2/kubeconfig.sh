#!/usr/bin/env bash

# To set up kube roles on cluser

for i in `kubectl get nodes | awk '{print $1}' | grep mini`; do kubectl label nodes $i kubernetes.io/role=worker; done