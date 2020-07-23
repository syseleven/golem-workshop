# network-policies

* Deny all traffic to web-application

```
kubectl apply -f deny-all.yaml
```

* Start a pod with Ubuntu any other namespace **in a different shell**

```
kubectl run -n default -it --image ubuntu:20.04 network-policy-test01 -- bash

# Install curl & dnsutils
apt update && DEBIAN_FRONTEND=noninteractive apt-get -y install curl dnsutils

# In the pod: Try to curl your web-application
curl web-application.web-application
```

* See that it times out

* Edit the namespace and add the label `network-policy/web-application: allow`, then deploy the allow-web-application.yaml

```
kubectl edit namespace default
kubectl apply -f allow-web-application.yaml
```

* In your test pod, see that it works again:

```
curl web-application.web-application
```
