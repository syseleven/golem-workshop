## 1. Simple Web Application

* Install Docker: https://docs.docker.com/install/
* Build docker image
```
docker build -t bashofmann/k8s-workshop-web-application:1.0.0 web-application/
```
* Run docker image locally
```
docker run --rm -p 8080:80 bashofmann/k8s-workshop-web-application:1.0.0
```
* Go to http://localhost:8080
* Deploy application
```
kubectl apply -f web-application/deployment/
```
* Get external IP from LoadBalancer Service
```
kubectl get service web-application
```
* Go to http://<IP_ADDRESS>
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
kubectl logs <WEB_APPLICATION_POD_NAME>
```
* Get shell in pod
```
kubectl exec -it <WEB_APPLICATION_POD_NAME> /bin/bash
```
* Port Forwarding
```
kubectl port-forward service/web-application 8080:80
```
* Go to http://localhost:8080
