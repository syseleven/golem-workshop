## 3. ConfigMaps and Secrets

* Deploy application
```
kubectl apply -f web-application/deployment/
```

* Show ConfigMap and Secret
```
kubectl get configmap,secret
kubectl describe configmaps web-application-config
kubectl describe secrets web-application-secret
kubectl get -o json secrets web-application-secret
kubectl get secrets web-application-secret -o jsonpath='{.data.passcode\.txt}' | base64 -d
```

* Go to http://..., see the values from the ConfigMap and the Secret
