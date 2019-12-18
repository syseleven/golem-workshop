# Logging with Loki

```
helm repo add loki https://grafana.github.io/loki/charts
helm repo update
helm upgrade --install loki loki/loki-stack --namespace monitoring -f loki-values.yaml
kubectl apply -f datasource.yaml
```
Restart Grafana
```
kubectl rollout restart deployment -n monitoring prom-grafana
# or
kubectl delete pod -n monitoring -l app=grafana
```
