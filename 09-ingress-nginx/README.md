# nginx Ingress Controller

* Install nginx ingress controller:

```sh
kubectl create namespace nginx-ingress
```

```sh
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm upgrade --install -f values.yaml --namespace nginx-ingress --version 2.11.0 nginx-ingress ingress-nginx/ingress-nginx
```
