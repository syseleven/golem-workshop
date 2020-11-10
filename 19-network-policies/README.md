# network-policies

* Deny all traffic to web-application

```
kubectl apply -f deny-all.yaml
```

* Start a busybox container pod in another namespace **in a different shell**

```
kubectl create namespace <YOUR_NAME>-policy
kubectl run -n <YOUR_NAME>-policy -it --image busybox network-policy-test -- sh

# In the pod: Try to reach your web-application
wget web-application.<YOUR_NAME>
```

* See that it times out

* Edit the namespace and add the label `network-policy/web-application: allow`, then deploy the allow-web-application.yaml

```
kubectl edit namespace <YOUR_NAME>-policy
kubectl apply -f allow-web-application.yaml
```

* In your test pod, see that it works again:

```
curl web-application.<YOUR_NAME>
```

* Remove the test setup

```
kubectl delete -f allow-web-application.yaml
kubectl delete -f deny-all.yaml
```
