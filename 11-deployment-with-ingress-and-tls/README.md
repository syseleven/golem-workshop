# Deployment with Ingress and TLS

* Edit hostnames in `web-application/deployment/ingress.yaml`
* Deploy application

```sh
# with nginx
kubectl apply -f web-application/deployment/nginx-ingress.yaml

# with traefik
kubectl apply -f web-application/deployment/traefik-ingress.yaml
```
