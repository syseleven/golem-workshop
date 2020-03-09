# Namespace Resource Limits

## Create namespace example

```sh
kubectl create namespace limits
```

## Deploy Quota and Limits

```sh
kubectl apply -f container-limit-range.yml -n limits
```

Deploy test app

```sh
kubectl run --generator=deployment/apps.v1 test-app --image=nginxdemos/hello --namespace limits
```

See that default requests and limits have been applied

```sh
kubectl describe pod --namespace limits
```

Apply quota

```sh
kubectl apply -f pod-quota.yml -n limits
```

Scale up

```sh
kubectl scale deployment test-app --replicas 3 --namespace limits
```

See that only one pod can be created

Create second deployment

```sh
kubectl delete deployment test-app -n limits

kubectl run --generator=run-pod/v1 test-app --image=nginxdemos/hello --namespace limits --requests="cpu=2"
```

See that pod can not be created

## Delete limits namespace again

```sh
kubectl delete namespace limits
```
