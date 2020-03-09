# nginx Ingress Controller

* Install nginx ingress controller:

```sh
kubectl create namespace nginx-ingress
```

```sh
helm upgrade --install -f values.yaml --namespace nginx-ingress --version 1.33.0 nginx-ingress stable/nginx-ingress
```
