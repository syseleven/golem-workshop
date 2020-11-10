# cert-manager

**This installation is required only once per cluster.**

## Install and configure cert-manager

```sh
helm repo add jetstack https://charts.jetstack.io
```

```sh
helm repo update
```

```sh
kubectl create namespace cert-manager
```

```sh
# You need kubectl v.1.19.0 or newer!
helm install cert-manager jetstack/cert-manager --namespace cert-manager --version v1.0.4 --set installCRDs=true
```

## Configuration for route53

* Add AWS Secret Key to `credentials-secret.yaml`
* Add AWS Access Key to `clusterissuer.yaml`

* Create ClusterIssuer

```sh
kubectl apply -f credentials-secret.yaml
kubectl apply -f clusterissuer.yaml
```

* Change hostnames in `certificate.yaml`
* Create wildcard certificate

```sh
kubectl apply -f certificate.yaml
```
