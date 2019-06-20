# Add weaveworks repo to helm and update

```
helm repo add weaveworks https://weaveworks.github.io/flux
helm repo up
````


# Install crd definitions

````
kubectl apply -f https://raw.githubusercontent.com/weaveworks/flux/master/deploy-helm/flux-helm-release-crd.yaml
````

# Create github repo

Name: `flux-state`

# Install flux operator for stage

````
kubectl create namespace stage
helm upgrade --install flux-stage --namespace flux-stage --set git.url=git@github.com:bashofmann/flux-state --set git.path=stage --set helmOperator.create=true --set helmOperator.createCRD=false --set helmOperator.allowNamespace=stage --set helmOperator.chartsSyncInterval=30s --set git.pollInterval=30s --set registry.pollInterval=30s weaveworks/flux
````

# Install flux client for Mac with brew

````
brew install fluxctl
````

# fetch ssh pub key from flux and add it to github

```
fluxctl identity --k8s-fwd-ns flux-stage
```

Open GitHub, navigate to your fork, go to Setting > Deploy keys, click on Add deploy key, give it a Title, check Allow write access, paste the Flux public key and click Add key.

# Install flux operator for prod

````
kubectl create namespace prod
helm upgrade --install flux-prod --namespace flux-prod --set git.url=git@github.com:bashofmann/flux-state --set git.path=prod --set helmOperator.create=true --set helmOperator.createCRD=false --set helmOperator.allowNamespace=prod --set helmOperator.chartsSyncInterval=30s --set git.pollInterval=30s --set registry.pollInterval=30s weaveworks/flux
````

# fetch ssh pub key from flux and add it to github

```
fluxctl identity --k8s-fwd-ns flux-prod
```

# fluxctl client commands

# show running controllers

fluxctl --k8s-fwd-ns flux-stage list-controllers -a

# fetch ssh pub key from flux

fluxctl --k8s-fwd-ns flux-stage identity

# force sync from git repo

fluxctl --k8s-fwd-ns flux-stage sync

# automate nginx ingress deployment

fluxctl --k8s-fwd-ns flux-stage automate --workspace=webapp:deployment/webapp
