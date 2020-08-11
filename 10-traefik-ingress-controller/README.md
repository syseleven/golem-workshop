# traefik

* Install traefik

```
kubectl create namespace traefik
```

```
helm upgrade --install --namespace traefik --version 1.86.1 traefik stable/traefik -f values.yaml
```

* Check dashboard

```
kubectl port-forward -n traefik svc/traefik-dashboard 9000:80
```

* Open http://localhost:9000/dashboard/
