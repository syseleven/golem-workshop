## Create admin service account with clusterrole binding

```
kubectl create serviceaccount simon-admin

kubectl get serviceaccounts simon-admin -o yaml

kubectl describe secret $(kubectl get secret | grep simon-admin | awk '{print $1}')
kubectl get secrets simon-admin-token-XXXXX -o jsonpath="{.data.token}" |base64 --decode

kubectl create -f simon-admin-cluster-role.yaml

kubectl create -f simon-admin-cluster-rolebinding.yaml
```


## Create service account with rolebinding limited to dev namespace

```
kubectl -n dev create serviceaccount simon-dev

kubectl -n dev get serviceaccounts simon-dev -o yaml

kubectl -n dev get secrets simon-dev-token-XXXXX -o jsonpath="{.data.token}" |base64 --decode

kubectl -n dev create -f simon-dev-role.yaml

kubectl -n dev create -f simon-dev-role-binding.yaml
```

## Add the user simon-admin and the context to your kubeconfig file
```
kubectl config set-credentials simon-admin --token=SECRET-TOKEN
kubectl config set-context --cluster=CLUSTER-ID --user=simon-admin simon-admin
```
## Add the user simon-dev and the context to your kubeconfig file
```
kubectl config set-credentials simon-dev --token=SECRET-TOKEN
kubectl config set-context --cluster=CLUSTER-ID --user=simon-dev simon-dev
```

## A context can also include an optional namespace
```
kubectl config set-context --cluster=CLUSTER-ID --user=simon-dev --namespace=dev simon-dev
```

## Switching contexts

## Switch to user simon-dev
```
kubectl config use-context simon-dev
```

## Switch to user simon-admin
```
kubectl config use-context simon-admin
```

## Install the RBAC-Manager

```
helm repo add reactiveops-stable https://charts.reactiveops.com/stable

helm upgrade --install rbac-manager reactiveops-stable/rbac-manager --namespace rbac-manager
```

## Install RBAC Lookup

```
brew install reactiveops/tap/rbac-lookup
```
