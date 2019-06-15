* Install the press labs mysql operator

```
helm repo add presslabs https://presslabs.github.io/charts
```

```
helm install presslabs/mysql-operator --namespace mysql-operator --name mysql-operator
```

```
kubectl create -f mysql-secrets.yaml
```

```
kubectl create  -f mysql-cluster.yaml
```


