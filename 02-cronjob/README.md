## 2. Simple CronJob

* Create cronjob
```
kubectl apply -f cronjob.yaml
```
* See Status of CronJob
```
kubectl get cronjobs
kubectl describe cronjbos
```
* See Status of Jobs
```
kubectl get jobs
kubectl describe jobs
```
* See Status of Pods
```
kubectl get pods
kubectl describe pods
kubectl logs <HELLO_JOBPOD_NAME>
```
