# Monitoring

Update domain names in values.yaml and install prometheus

```
kubectl create namespace monitoring
kubectl apply -f basic-auth.yaml
helm upgrade --install --namespace monitoring -f values.yaml prom stable/prometheus-operator
kubectl apply -f dashboards/
kubectl apply -f service-monitors/
```


To quick-fix in case of errors:

```
kubectl apply -f https://raw.githubusercontent.com/coreos/prometheus-operator/master/example/prometheus-operator-crd/monitoring.coreos.com_alertmanagers.yaml
kubectl apply -f https://raw.githubusercontent.com/coreos/prometheus-operator/master/example/prometheus-operator-crd/monitoring.coreos.com_podmonitors.yaml
kubectl apply -f https://raw.githubusercontent.com/coreos/prometheus-operator/master/example/prometheus-operator-crd/monitoring.coreos.com_prometheuses.yaml
kubectl apply -f https://raw.githubusercontent.com/coreos/prometheus-operator/master/example/prometheus-operator-crd/monitoring.coreos.com_prometheusrules.yaml
kubectl apply -f https://raw.githubusercontent.com/coreos/prometheus-operator/master/example/prometheus-operator-crd/monitoring.coreos.com_servicemonitors.yaml
helm template --namespace monitoring -f values.yaml prom stable/prometheus-operator | kubectl apply -f -
```
