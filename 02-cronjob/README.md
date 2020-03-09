# CronJobs

* Create cronjob

```sh
kubectl apply -f cronjob.yaml
```

* See Status of CronJob

```sh
kubectl get cronjobs
kubectl describe cronjobs
```

* See Status of Jobs

```sh
kubectl get jobs
kubectl describe jobs
```

* See Status of Pods

```sh
kubectl get pods
kubectl describe pods
kubectl logs <HELLO_JOBPOD_NAME>
```
