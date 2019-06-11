# 4. Namespace Resource Limits


## Create namespace example

```
kubectl create namespace limits
```

## Deploy Quota and Limits

```
kubectl apply -f . -n limits
```

Deploy test app

```
kubectl run test-app --image=nginxdemos/hello --namespace limits --replicas 3 --requests="cpu=500m,memory=700Mi"
```

See that replicaset can't be created

```
kubectl describe replicasets --namespace limits
```

## Delete limits namespace again

```
kubectl delete namespace limits
```





