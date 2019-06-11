## Helm

* Create a new namespace
```
kubectl create namespace dev-flow-demo
kubens dev-flow-demo
```
* Deploy mysql
```
kubectl apply -f ../11-mysql/mysql-single-secret/
```
* Run tilt
```
tilt up
```
* Code changes will be automatically deployed
* Run telepresence to get shell
```
telepresence
curl http://quote-svc/quote
```
* Swap deployment with telepresence
```
cd src/quote-svc
telepresence --swap-deployment quote-svc --namespace dev-flow-demo --expose 3000 --run npm run debug
```
