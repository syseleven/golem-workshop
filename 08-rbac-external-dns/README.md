# Role based access control for external-dns

external-dns is accessing the Kubernetes API. How?

```sh
kubectl get deployment external-dns -n external-dns -o yaml
```

* Fetch ServiceAccount

```sh
kubectl get serviceaccount external-dns -n external-dns -o yaml
```

* Get token of service account

```sh
kubectl get secrets -n external-dns external-dns-token-xxxxx
```

* Get ClusterRoleBinding

```sh
kubectl get clusterrolebinding external-dns -n external-dns -o yaml
```

* Get ClusterRole

```sh
kubectl get clusterrole external-dns -n external-dns -o yaml
```
