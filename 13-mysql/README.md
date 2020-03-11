# MySQL

* Install the press labs mysql operator

```sh
helm repo add presslabs https://presslabs.github.io/charts
kubectl create namespace mysql-operator
kubectl apply -f https://raw.githubusercontent.com/presslabs/mysql-operator/master/config/crds/mysql_v1alpha1_mysqlcluster.yaml
kubectl apply -f https://raw.githubusercontent.com/presslabs/mysql-operator/master/config/crds/mysql_v1alpha1_mysqlbackup.yaml
helm upgrade --install mysql-operator presslabs/mysql-operator --namespace mysql-operator -f operator-values.yaml
```

* Change domain names in mysql-operator/mysql-orchestrator-ingress.yaml
* Add Ingress for mysql-orchestrator dashboard

```sh
kubectl apply -f mysql-operator/basic-auth.yaml
kubectl apply -f mysql-operator/mysql-orchestrator-ingress.yaml
```

* Create a secret with credentials

```sh
kubectl apply -f mysql-operator/mysql-secret.yaml
```

* Create a cluster

```sh
kubectl apply -f mysql-operator/mysql-cluster.yaml
```

* See orchestrator dashboard
