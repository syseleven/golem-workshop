# Logging with Loki

**This installation is required only once per cluster.**

## Install Loki and configure Grafana

```sh
helm repo add loki https://grafana.github.io/loki/charts
helm repo update
helm upgrade --install loki loki/loki-stack --namespace monitoring -f loki-values.yaml --version 2.0.2
kubectl apply -f datasource.yaml
```

## Restart Grafana

```sh
kubectl rollout restart deployment -n monitoring prom-grafana
```
