# 7. cert-manager

* Install and configure cert-manager for digital ocean
```
kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.10/deploy/manifests/00-crds.yaml
kubectl create namespace cert-manager
kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm upgrade --install --namespace cert-manager -f digitalocean/cert-manager.yaml cert-manager jetstack/cert-manager
```

* Add Digital Ocean API Token to `digitalocean/digitalocean-dns-secret.yaml`

* Create ClusterIssuer
```
kubectl apply -f digitalocean/dns-secret.yaml
kubectl apply -f digitalocean/clusterissuer.yaml
```

* Change hostnames in `certificate.yaml`
* Create wildcard certificate
```
kubectl apply -f digitalocean/certificate.yaml
```


* Install and configure cert-manager for AWS Route53
```
kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.10/deploy/manifests/00-crds.yaml
kubectl create namespace cert-manager
kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm upgrade --install --namespace cert-manager -f route53/cert-manager.yaml cert-manager jetstack/cert-manager
```

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
