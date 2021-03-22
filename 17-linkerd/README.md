# LinkerD Service Mesh

**This installation is required only once per cluster.**

* Download linkerd CLI: https://linkerd.io/2/getting-started/#step-1-install-the-cli
* Check if everything is correct for LinkerD
* For Kubernetes >=1.17.0 the Clock Skew error can be ignored

```sh
linkerd check --pre
```

* Install LinkerD

```sh
linkerd install | kubectl apply -f -
```

* Add Ingress for LinkerD dashboard

```sh
kubectl apply -f basic-auth.yaml
kubectl apply -f linkerd-ingress.yaml
```

* Add linkerd-viz extension
linkerd viz install | kubectl apply -f -

* Inject LinkerD proxy into existing deployments

Add the "linkerd.io/inject: enabled" anntation to pods

```sh
kubectl edit deployment web-application

# in metadata.annotations, add a new line with "linkerd.io/inject: enabled"
# save and close your editor
```

Or run

```sh
kubectl get deployments -o yaml | linkerd inject - | kubectl apply -f -
```

* Check LinkerD dashboard

linkerd viz dashboard &
kubectl -n ingress-nginx get deployments -o yaml | linkerd inject - | kubectl apply -f -

