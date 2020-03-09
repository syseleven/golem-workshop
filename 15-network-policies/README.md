# Network policies

* Create test namespace

```sh
kubectl create namespace network-policy-test
```

* Call nginx with curl from network-policy-test namespace

```sh
kubectl --generator=run-pod/v1 --namespace network-policy-test run curl --image=radial/busyboxplus:curl --restart=Never --rm -i --command curl -- http://nginx.web-application -v --connect-timeout 5
```

* Create network policy that forbids call

```sh
kubectl apply -f network-policy.yaml
```

* See that connection can not be established

```sh
kubectl --generator=run-pod/v1 --namespace network-policy-test run curl --image=radial/busyboxplus:curl --restart=Never --rm -i --command curl -- http://nginx.web-application -v --connect-timeout 5
```

* label namespace

```sh
kubectl label namespace network-policy-test access=allowed
```

* See that connection works again

```sh
kubectl --generator=run-pod/v1 --namespace network-policy-test run curl --image=radial/busyboxplus:curl --restart=Never --rm -i --command curl -- http://nginx.web-application -v --connect-timeout 5
```

* remove label

```sh
kubectl label namespace network-policy-test access-
```

* See that connection can not be established

```sh
kubectl --generator=run-pod/v1 --namespace network-policy-test run curl --image=radial/busyboxplus:curl --restart=Never --rm -i --command curl -- http://nginx.web-application -v --connect-timeout 5
```

* Delete network policy that forbids call

```sh
kubectl delete -f network-policy.yaml
```

* See that connection works again

```sh
kubectl --generator=run-pod/v1 --namespace network-policy-test run curl --image=radial/busyboxplus:curl --restart=Never --rm -i --command curl -- http://nginx.web-application -v --connect-timeout 5
```
