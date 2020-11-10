# MySQL

* Add percona helm repository

```sh
helm repo add percona https://percona.github.io/percona-helm-charts
```

* Deploy the operator

```sh
helm install --version 0.1.10 pxc-operator percona/pxc-operator
```

* Install a database

```sh
helm install --version 0.1.13 --values db-values.yaml pxc-db percona/pxc-db
```
