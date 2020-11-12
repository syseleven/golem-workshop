# Monitoring with prometheus

**This installation is required only once per cluster.**

```sh
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
```

```sh
kubectl create namespace monitoring
kubectl apply -f basic-auth.yaml
helm upgrade --install --namespace monitoring -f values.yaml --version 11.1.1 prom prometheus-community/kube-prometheus-stack
kubectl apply -f dashboards/
kubectl apply -f service-monitors/

# Force reloading of grafana dashboards if needed
kubectl rollout restart deployment prom-grafana
```
