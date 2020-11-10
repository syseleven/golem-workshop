# Production-grade Deployments

* Deploy application

```sh
kubectl apply -f web-application/deployment/
```

* See that pods are schedules

```sh
kubectl get pods
```

* Create autoscaler

```sh
kubectl autoscale deployment web-application --min=2 --max=6 --cpu-percent=2
kubectl get horizontalpodautoscaler
kubectl describe horizontalpodautoscalers web-application
kubectl top pods
```

* Remove autoscaler

```sh
kubectl delete horizontalpodautoscalers.autoscaling web-application
```

* Scale deployment down again

```sh
kubectl scale deployment web-application --replicas 2
```
