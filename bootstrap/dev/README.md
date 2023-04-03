Bootsrap instructions:
```
kubectl apply -k https://github.com/argoproj/argo-cd/manifests/crds\?ref\=stable
export ARGOCD_APP_NAME="argocd-dev"
helm dependency build ../argo-cd
helm template --release-name ${ARGOCD_APP_NAME} ../argo-cd -f ../argo-cd/values.yaml > ../argo-cd/all.yaml && kustomize build | kubectl apply -f -
```
