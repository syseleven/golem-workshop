# Simple Web Application

* Install Docker: https://docs.docker.com/install/
* Build docker image

```sh
docker build -t syseleven/k8s-workshop-web-application:1.0.0 web-application/
```

* Run docker image locally

```sh
docker run --rm -p 8080:80 syseleven/k8s-workshop-web-application:1.0.0
```

* Go to http://localhost:8080
* Deploy application

```sh
kubectl apply -f web-application/deployment/
```

* Get external IP from LoadBalancer Service

```sh
kubectl get service web-application
```

* Go to http://<IP_ADDRESS>
* Scale it up to two pods

```sh
kubectl scale deployment web-application --replicas 2
```

* See Status of Deployment

```sh
kubectl get deployments
kubectl describe deployment web-application
kubectl get deployment web-application -o yaml
```

* See Status of ReplicaSets

```sh
kubectl get replicasets
kubectl describe replicasets
```

* See Status of Pods

```sh
kubectl get pods
kubectl describe pods
kubectl logs <WEB_APPLICATION_POD_NAME>
```

* Get shell in pod

```sh
kubectl exec -it <WEB_APPLICATION_POD_NAME> -- /bin/bash
```

* Port Forwarding

```sh
kubectl port-forward service/web-application 8080:80
```

* Go to http://localhost:8080
