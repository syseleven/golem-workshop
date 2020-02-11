# 7. External DNS

* Install Helm: https://docs.helm.sh/using_helm/#installing-helm

```
helm repo add stable https://kubernetes-charts.storage.googleapis.com/
helm repo update
```

* Replace all occurrences of `CHANGEME` in values.yaml

* Install external-dns with Helm:

```
kubectl create namespace external-dns
```
```
helm upgrade --install external-dns --namespace=external-dns -f values.yaml stable/external-dns
```

* Deploy nginx test with dns entry:

```
kubectl apply -f nginx-test.yaml
```
