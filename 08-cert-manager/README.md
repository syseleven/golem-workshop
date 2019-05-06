# 8. cert-manager

* Install cert-manager
```
kubectl apply -f https://raw.githubusercontent.com/jetstack/cert-manager/release-0.7/deploy/manifests/00-crds.yaml
kubectl create namespace cert-manager
kubectl label namespace cert-manager certmanager.k8s.io/disable-validation=true
helm repo add jetstack https://charts.jetstack.io
helm repo update
helm install --namespace cert-manager -f cert-manager.yaml --name cert-manager jetstack/cert-manager
```

* Add DigitalOcean API Token to `digitalocean-dns-secret.yaml`

* Create ClusterIssuer
```
kubectl create -f digitialocean-dns-secret.yaml
kubectl create -f clusterissuer-digitalocean.yaml
```

* Change hostnames in `certificate.yaml`
* Create wildcard certificate
```
kubectl apply -f certificate.yaml
```
