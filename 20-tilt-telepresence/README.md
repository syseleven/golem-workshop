# Tilt and Telepresence

* Create a new namespace
```
kubectl create namespace dev-flow-demo
kubens dev-flow-demo
```
* Deploy mysql
```
kubectl apply -f ../10-mysql/mysql-operator/
```
* Install tilt

```
brew tap windmilleng/tap
brew install windmilleng/tap/tilt
```

* Update the `allow_k8s_contexts` in `Tiltfile` to your context
* start your docker daemon (if not already running)
* If you don’t have push access to the SysEleven organization on dockerhub, you need to `docker login` with your dockerhub user and change the images ìn:
    * `src/web-application/deployment/deployment.yaml`
    * `quote-svc-values.yaml`
    * `hello-svc-values.yaml`
* Run tilt

```
tilt up
```

* Code changes will be automatically deployed

* Install telepresence and npm

```
brew cask install osxfuse
brew install datawire/blackbird/telepresence
brew install npm
```

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
