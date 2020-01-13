## Helm


* Install quote-svc
```
helm upgrade --install quote-svc helm-charts/quote-svc -f quote-svc-values.yaml
```

* Install hello-svc
```
helm upgrade --install hello-svc helm-charts/hello-svc -f hello-svc-values.yaml
```

* Print YAML that helm would apply

```
 helm template hello-svc helm-charts/hello-svc -f hello-svc-values.yaml -f hello-svc-stage.yaml --set image.tag=10.0.1
```

* Test installation
```
helm test hello-svc
```

* Install helm-kubeval plugin

```
helm plugin install https://github.com/instrumenta/helm-kubeval
```

* Validate chart against Kubernetes schema

```
helm kubeval helm-charts/hello-svc
```

* Install helm-diff plugin

```
helm plugin install https://github.com/databus23/helm-diff --version v2.11.0+5
```
* Change something in the hello-svc chart
* Run helm-diff

```
helm diff upgrade hello-svc helm-charts/hello-svc -f hello-svc-values.yaml -f hello-svc-stage.yaml
```

* Upgrade the chart

```
helm upgrade hello-svc helm-charts/hello-svc -f hello-svc-values.yaml -f hello-svc-stage.yaml
```
