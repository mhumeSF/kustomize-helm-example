Bootsrap instructions:
```
kubectl apply -k https://github.com/argoproj/argo-cd/manifests/crds\?ref\=v2.6.7
kubectl create namespace argocd
export ARGOCD_APP_NAME="argocd-dev"
helm dependency update ../base
helm dependency build ../base
helm template --release-name ${ARGOCD_APP_NAME} ../base -f ../base/values.yaml > ../base/all.yaml && kustomize build | kubectl --namespace argocd apply -f -
```
