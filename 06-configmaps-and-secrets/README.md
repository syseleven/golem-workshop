## 3. ConfigMaps and Secrets

* Build docker image
```
docker build -t bashofmann/k8s-workshop-web-application:3.0.0 03-configmaps-and-secrets/web-application/
```
* Deploy application
```
kubectl apply -f 03-configmaps-and-secrets/web-application/deployment/
```
