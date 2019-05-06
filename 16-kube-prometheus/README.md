# 16. kube-prometheus

## Already prepared

Build manifests

```
jb install
./build.sh
```

## Installation

* Install
```
kubectl apply -f manifests/
```
* Edit hostnames in `ingresses.yaml`
* Add Ingress for LinkerD dashboard
```
kubectl apply -f ingresses.yaml
```
* Add ServiceMonitor for nginx-ingress-controller
```
kubectl apply -f nginx-ingress-service-monitor.yaml
```
