## 3. ConfigMaps and Secrets

* Build docker image
```
docker build -t bashofmann/k8s-workshop-web-application:3.0.0 web-application/
```
* Deploy application
```
kubectl apply -f web-application/deployment/
```
