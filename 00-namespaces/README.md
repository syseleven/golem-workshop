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
kubectl create namespace <YOUR_NAME>
```

* Set default namespace to context

```sh
kubectl config set-context --current --namespace=<YOUR_NAME>
```

* See change in kubeconfig

```sh
cat ~/.kube/config
```

* Verify that helm is installed (should be 3.x.x)

```sh
helm version
```
