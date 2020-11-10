# Helm

* Install quote-svc

```sh
helm upgrade --install quote-svc helm-charts/quote-svc -f quote-svc-values.yaml
```

* Install hello-svc

```sh
helm upgrade --install hello-svc helm-charts/hello-svc -f hello-svc-values.yaml
```

* Print YAML that helm would apply

```sh
helm template hello-svc helm-charts/hello-svc -f hello-svc-values.yaml -f hello-svc-stage.yaml --set image.tag=10.0.1
```

* Test installation

```sh
helm test hello-svc
```

* Install helm-kubeval plugin

```sh
helm plugin install https://github.com/instrumenta/helm-kubeval
```

* Validate chart against Kubernetes schema

```sh
helm kubeval helm-charts/hello-svc
```

* Install helm-diff plugin

```sh
helm plugin install https://github.com/databus23/helm-diff
```

* Change something in the hello-svc chart
* Run helm-diff

```sh
helm diff upgrade hello-svc helm-charts/hello-svc -f hello-svc-values.yaml -f hello-svc-stage.yaml
```

* Upgrade the chart

```sh
helm upgrade hello-svc helm-charts/hello-svc -f hello-svc-values.yaml -f hello-svc-stage.yaml
```
