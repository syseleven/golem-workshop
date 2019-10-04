# Sealed secrets

* Install sealed secrets controller
```
helm upgrade --install --namespace kube-system sealed-secrets stable/sealed-secrets
```

* Install kubeseal client https://github.com/bitnami-labs/sealed-secrets#homebrew
* Encrypt secret
```
kubectl create secret generic my-secret --dry-run --from-literal=secret=value -o json | kubeseal --controller-name sealed-secrets > encrypted-my-secret.yaml
```

* Create sealed secret in cluster
```
kubectl apply -f encrypted-my-secret.yaml
```

* Check that secret was created by the controller
```
kubectl get secret my-secret -o jsonpath={.data.secret} | base64 --decode
```
