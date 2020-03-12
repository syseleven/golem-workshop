# Namespaces

* Download kubeconfig
* Copy kubeconfig to `~/.kube/config`
* Install kubectl: https://kubernetes.io/docs/tasks/tools/install-kubectl/
* Try connection

```sh
kubectl version
```

* List Namespaces

```sh
kubectl get namespaces
```

* Create Namespace

```sh
kubectl create namespace web-application
```

* Set default namespace to context

```sh
kubectl config set-context --current --namespace=web-application
```

* See change in kubeconfig

```sh
cat ~/.kube/config
```

* Verify that helm is installed (should be 3.x.x)

```sh
helm version
helm repo add stable https://kubernetes-charts.storage.googleapis.com
```
