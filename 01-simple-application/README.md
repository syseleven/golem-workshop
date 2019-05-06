## 1. Simple Web Application

* Build docker image
```
docker build -t bashofmann/k8s-workshop-web-application:1.0.0 01-simple-application/web-application/
```
* Deploy application
```
kubectl apply -f 01-simple-application/web-application/deployment/
```
* Get external IP from LoadBalancer Service
```
kubectl get service web-application
```
* Scale it up to two pods
```
kubectl scale deployment web-application --replicas 2
```
* See Status of Deployment
```
kubectl get deployments
kubectl describe deployment web-application
kubectl get deployment web-application -o yaml
```
* See Status of ReplicaSets
```
kubectl get replicasets
kubectl describe replicasets
```
* See Status of Pods
```
kubectl get pods
kubectl describe pods
kubectl logs web-application-pod-name
```
* Get shell in pod
```
kubectl exec -it web-application-pod-name /bin/bash
```
* Port Forwarding
```
kubectl port-forward service/web-application 8080:80
```
