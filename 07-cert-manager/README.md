# cert-manager

## Install and configure cert-manager

```sh
kubectl apply --validate=false -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.12/deploy/manifests/00-crds.yaml
```

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
helm upgrade --install --namespace cert-manager --version v0.12.0 cert-manager jetstack/cert-manager
```

## Configuration for route53

* Add AWS Secret Key to `route53/credentials-secret.yaml`

* Add AWS Access Key to `route53/clusterissuer.yaml`

* Create ClusterIssuer

```sh
kubectl apply -f route53/credentials-secret.yaml
kubectl apply -f route53/clusterissuer.yaml
```

* Change hostnames in `certificate.yaml`
* Create wildcard certificate

```sh
kubectl apply -f route53/certificate.yaml
```

## Configuration for designate

* Clone the designate certmanger repository and follow the install instructions

```sh
git clone git@github.com:syseleven/designate-certmanager-webhook.git
```

* Create ClusterIssuer

```sh
kubectl apply -f designate/clusterissuer.yaml
```

* Change hostnames in `certificate.yaml`
* Create wildcard certificate

```sh
kubectl apply -f designate/certificate.yaml
```
