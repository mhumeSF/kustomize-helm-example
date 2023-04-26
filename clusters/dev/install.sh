#!/bin/bash
set -eux
kind create cluster --name control --config=cluster.yaml
kubectl apply -k https://github.com/argoproj/argo-cd/manifests/crds\?ref\=v2.6.7
kubectl create namespace argocd
export ARGOCD_APP_NAME="argocd"
helm dependency update ../base > /dev/null && echo "helm dependencies updated"
helm dependency build ../base > /dev/null && echo "helm dependencies built"
helm template --release-name ${ARGOCD_APP_NAME} ../base -f ../base/values.yaml -f values.yaml --namespace argocd > ../base/all.yaml && kustomize build | kubectl -n argocd apply -f -
kubectl apply -f ../../repo-secret.yaml
# CLUSTER_TOPOLOGY=true clusterctl init --infrastructure docker
# sleep 30
# clusterctl generate cluster d1 --flavor development --infrastructure docker --kubernetes-version v1.23.13 | kubectl apply -f -
