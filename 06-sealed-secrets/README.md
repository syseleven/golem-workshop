# Sealed secrets

**This installation is required only once per cluster.**

* Install sealed secrets controller

```sh
helm repo add stable https://charts.helm.sh/stable
helm upgrade --install --namespace kube-system --version 1.12.0 sealed-secrets-controller stable/sealed-secrets
```

* Install kubeseal client https://github.com/bitnami-labs/sealed-secrets#homebrew
* Encrypt secret

```sh
kubectl create secret generic my-secret --dry-run=client --from-literal=secret=value -o json | kubeseal > sealed-secret.yaml
```

* Create sealed secret in cluster

```sh
kubectl apply -f sealed-secret.yaml
```

* Check that secret was created by the controller

```sh
kubectl get secret my-secret -o jsonpath={.data.secret} | base64 --decode
```
