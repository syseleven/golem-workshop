# cert-manager

## Install and configure cert-manager

```
kubectl apply --validate=false -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.12/deploy/manifests/00-crds.yaml
```

```
helm repo add jetstack https://charts.jetstack.io
```

```
helm repo update
```

```
kubectl create namespace cert-manager
```

```
helm upgrade --install --namespace cert-manager --version v0.12.0 cert-manager jetstack/cert-manager
```

## Configuration for route53

* Add AWS Secret Key to `route53/credentials-secret.yaml`

* Add AWS Access Key to `route53/clusterissuer.yaml`

* Create ClusterIssuer

```
kubectl apply -f route53/credentials-secret.yaml
kubectl apply -f route53/clusterissuer.yaml
```

* Change hostnames in `certificate.yaml`
* Create wildcard certificate

```
kubectl apply -f route53/certificate.yaml
```

## Configuration for designate

* Clone the designate certmanger repository and follow the install instructions

```
git clone git@github.com:syseleven/designate-certmanager-webhook.git
```

* Create ClusterIssuer

```
kubectl apply -f designate/clusterissuer.yaml
```

* Change hostnames in `certificate.yaml`
* Create wildcard certificate

```
kubectl apply -f designate/certificate.yaml
```