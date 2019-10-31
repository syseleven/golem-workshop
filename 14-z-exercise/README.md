# Exercise

* Deploy the Helm chart stable/ghost (https://github.com/helm/charts/tree/master/stable/ghost)
* Configure it so that it uses the Ingress controller, the Certificate and the MySQL database created before
* Installation would look like:
```
helm upgrade --install ghost stable/ghost -f values.yaml
```

Bonus:

* Inject LinkerD Proxies into the Ghost Deployment
