# Network policies

* Create test namespace

```
kubectl create namespace network-policy-test
```

* Call nginx with curl from network-policy-test namespace

```
kubectl --generator=run-pod/v1 --namespace network-policy-test run curl --image=radial/busyboxplus:curl --restart=Never --rm -i --command curl -- http://nginx.web-application -v --connect-timeout 5
```

* Create network policy that forbids call

```
kubectl apply -f network-policy.yaml
```

* See that connection can not be established

```
kubectl --generator=run-pod/v1 --namespace network-policy-test run curl --image=radial/busyboxplus:curl --restart=Never --rm -i --command curl -- http://nginx.web-application -v --connect-timeout 5
```

* label namespace

```
kubectl label namespace network-policy-test access=allowed
```

* See that connection works again

```
kubectl --generator=run-pod/v1 --namespace network-policy-test run curl --image=radial/busyboxplus:curl --restart=Never --rm -i --command curl -- http://nginx.web-application -v --connect-timeout 5
```

* remove label

```
kubectl label namespace network-policy-test access-
```

* See that connection can not be established

```
kubectl --generator=run-pod/v1 --namespace network-policy-test run curl --image=radial/busyboxplus:curl --restart=Never --rm -i --command curl -- http://nginx.web-application -v --connect-timeout 5
```

* Delete network policy that forbids call

```
kubectl delete -f network-policy.yaml
```

* See that connection works again

```
kubectl --generator=run-pod/v1 --namespace network-policy-test run curl --image=radial/busyboxplus:curl --restart=Never --rm -i --command curl -- http://nginx.web-application -v --connect-timeout 5
```
