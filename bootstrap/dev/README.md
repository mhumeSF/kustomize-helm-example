Bootsrap instructions:
```
kubectl apply -k https://github.com/argoproj/argo-cd/manifests/crds\?ref\=stable
export ARGOCD_APP_NAME="argocd-dev"
helm dependency build ../base
helm template --release-name ${ARGOCD_APP_NAME} ../base -f ../base/values.yaml > ../base/all.yaml && kustomize build | kubectl apply -f -
```
