# 11. MySql

* Install the press labs mysql operator

```
helm repo add presslabs https://presslabs.github.io/charts
helm install presslabs/mysql-operator --namespace mysql-operator --name mysql-operator
```

* Change domain names in mysql-operator/mysql-orchestrator-ingress.yaml
* Add Ingress for mysql-orchestrator dashboard
```
kubectl apply -f mysql-operator/basic-auth.yaml
kubectl apply -f mysql-operator/mysql-orchestrator-ingress.yaml
```

* Create a secret with credentials

```
kubectl apply -f mysql-operator/mysql-secret.yaml
```

* Create a cluster

```
kubectl apply -f mysql-operator/mysql-cluster.yaml
```

* See orchestrator dashboard
