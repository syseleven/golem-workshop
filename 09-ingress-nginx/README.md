# nginx Ingress Controller

**This installation is required only once per cluster.**

* Install nginx ingress controller:

```sh
kubectl create namespace ingress-nginx
```

```sh
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm upgrade --install -f values.yaml --namespace ingress-nginx --version 3.8.0 ingress-nginx ingress-nginx/ingress-nginx
```
