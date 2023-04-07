#!/bin/bash
kubectl apply -k https://github.com/argoproj/argo-cd/manifests/crds\?ref\=v2.6.7
kubectl create namespace argocd
export ARGOCD_APP_NAME="argocd-dev"
helm dependency update ../base > /dev/null && echo "helm dependencies updated"
helm dependency build ../base > /dev/null && echo "helm dependencies built"
helm template --release-name ${ARGOCD_APP_NAME} ../base -f ../base/values.yaml > ../base/all.yaml && kustomize build | kubectl apply -f -
