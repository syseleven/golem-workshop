# 9. Nginx Ingress Controller

* Install nginx ingress controller:

```
kubectl create namespace nginx-ingress
```
```
helm upgrade --install -f values.yaml --namespace nginx-ingress nginx-ingress stable/nginx-ingress
```
