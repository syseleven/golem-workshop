## Helm


* Install quote-svc
```
helm upgrade --install quote-svc helm-charts/quote-svc -f quote-svc-values.yaml
```

* Install hello-svc
```
helm upgrade --install hello-svc helm-charts/hello-svc -f hello-svc-values.yaml
```

* Install helm-diff plugin

```
helm plugin install https://github.com/databus23/helm-diff --version v2.11.0+5
```

* Run helm-diff

```
helm diff upgrade hello-svc helm-charts/hello-svc -f hello-svc-values.yaml -f hello-svc-stage.yaml
```

* Upgrade the chart

```
helm upgrade hello-svc helm-charts/hello-svc -f hello-svc-values.yaml -f hello-svc-stage.yaml
```