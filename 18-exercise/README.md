# Exercise

* Deploy the Helm chart stable/ghost (https://github.com/helm/charts/tree/master/stable/ghost)
* Configure it so that it uses the Ingress controller, the Certificate and the MySQL database created before
* Installation would look like:

```sh
helm repo add bitnami https://charts.bitnami.com/bitnami
helm upgrade --install ghost bitnami/ghost -f values.yaml
```

Bonus:

* Inject LinkerD Proxies into the Ghost Deployment
