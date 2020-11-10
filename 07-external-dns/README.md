# External DNS

**This installation is required only once per cluster.**

* Install Helm: https://docs.helm.sh/using_helm/#installing-helm

```sh
helm repo add bitnami https://charts.bitnami.com/bitnami
helm repo update
```

* Replace all occurrences of `CHANGEME` and `<YOUR_NAME>` in values.yaml with the provided secrets

* Install external-dns with Helm:

```sh
kubectl create namespace external-dns
```

```sh
helm upgrade --install external-dns --namespace external-dns --version 3.7.0 --values values.yaml bitnami/external-dns
```

* Replace occurrence of `YOUR_NAME` in nginx-test.yaml

* Deploy nginx test with dns entry:

```sh
kubectl apply -f nginx-test.yaml --namespace <YOUR_NAME>
```
