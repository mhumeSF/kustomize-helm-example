```
export ARGOCD_APP_NAME="argocd-dev"
helm dependency build ../../base
helm template --release-name ${ARGOCD_APP_NAME} ../../base -f ../../base/values.yaml -f values.yaml > ../../base/all.yaml && kustomize build
```
