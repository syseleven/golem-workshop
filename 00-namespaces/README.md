## 0. Set up a namespace
* Download kubeconfig
* Copy kubeconfig to `~/.kube/config`
* Install kubectl: https://kubernetes.io/docs/tasks/tools/install-kubectl/
* Try connection
```
kubectl version
```
* List Namespaces
```
kubectl get namespaces
```
* Create Namespace
```
kubectl create namespace web-application
```
* Set default namespace to context
```
kubectl config set-context admin@k8s-workshop1/workshop<X> --namespace=web-application 
```
* See change in kubeconfig
```
cat ~/.kube/config
```

* Verify that helm is installed (should be 3.x.x)
```
helm version
helm repo add stable https://kubernetes-charts.storage.googleapis.com
```