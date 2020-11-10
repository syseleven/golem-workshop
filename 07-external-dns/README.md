# External DNS

**This installation is required only once per cluster.**

```sh
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
```

* Replace all occurrences of `CHANGEME` in values.yaml with the provided secrets

* Install external-dns with Helm:

```sh
kubectl create namespace external-dns
```

```sh
helm upgrade --install external-dns --namespace external-dns --version 3.7.0 --values values.yaml bitnami/external-dns
```

* Deploy nginx test with dns entry:

```sh
kubectl apply -f nginx-test.yaml --namespace external-dns
```
