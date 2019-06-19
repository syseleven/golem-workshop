# 11. MySql

* Install the press labs mysql operator

```
helm repo add presslabs https://presslabs.github.io/charts
helm install presslabs/mysql-operator --namespace mysql-operator --name mysql-operator
```

Create a secret with credentials

```
kubectl create -f mysql-operator/mysql-secret.yaml
```

Create a cluster

```
kubectl create  -f mysql-operator/mysql-cluster.yaml
```
