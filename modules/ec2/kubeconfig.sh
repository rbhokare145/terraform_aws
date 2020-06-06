#!/usr/bin/env bash

# To set up kube roles on cluser

for i in `kubectl get nodes |  grep -v master | awk '{print $1}' | grep -i ip`; do kubectl label nodes $i kubernetes.io/role=worker; done