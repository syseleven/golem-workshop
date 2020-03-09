# Namespace Resource Limits


## Create namespace example

```
kubectl create namespace limits
```

## Deploy Quota and Limits

```
kubectl apply -f container-limit-range.yml -n limits
```

Deploy test app

```
kubectl run --generator=deployment/apps.v1 test-app --image=nginxdemos/hello --namespace limits
```

See that default requests and limits have been applied

```
kubectl describe pod --namespace limits
```

Apply quota

```
kubectl apply -f pod-quota.yml -n limits
```

Scale up

```
kubectl scale deployment test-app --replicas 3 --namespace limits
```

See that only one pod can be created

Create second deployment

```
kubectl delete deployment test-app -n limits

kubectl run --generator=run-pod/v1 test-app --image=nginxdemos/hello --namespace limits --requests="cpu=2"
```

See that pod can not be created

## Delete limits namespace again

```
kubectl delete namespace limits
```
