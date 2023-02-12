#!/bin/bash
echo -e "\n[INFO] Install kubernetes Dashboard."
kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/v2.7.0/aio/deploy/recommended.yaml

echo -e "\n[INFO] Create kubernetes role binding."
kubectl apply -f role_binding.yml

echo -e "\n[INFO] Create kubernetes service account."
kubectl apply -f service_account.yml

echo -e "\n[INFO] Create kubernetes dashboard user."
kubectl -n kubernetes-dashboard create token admin-user

echo -e "\n[INFO] Enable kubernetes metrics server."
kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

echo -e "\n[INFO] Get kubernetes dashboard deployment."
kubectl get deployment metrics-server -n kube-system
