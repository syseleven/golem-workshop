# Role based access control

External-dns is accessing the Kubernetes API. How?

```
kubectl get deployment external-dns -n external-dns -o yaml
```

Fetch ServiceAccount

```
kubectl get serviceaccount external-dns -n external-dns -o yaml
```

Get token of service account

Get ClusterRoleBinding
```
kubectl get clusterrolebinding external-dns -n external-dns -o yaml
```

Get ClusterRole

```
kubectl get clusterrole external-dns -n external-dns -o yaml
```

Use token in local kubeconfig
