# Add weaveworks repo to helm and update

```sh
helm repo add fluxcd https://charts.fluxcd.io
helm repo up
```

# Install crd definitions

```sh
kubectl apply -f https://raw.githubusercontent.com/fluxcd/helm-operator/master/deploy/flux-helm-release-crd.yaml
```

# Create github repo

Fork it from https://github.com/fluxcd/flux-get-started

# Install flux operator for stage

```sh
kubectl create namespace flux
helm upgrade -i flux fluxcd/flux \
--set helmOperator.create=true \
--set helmOperator.createCRD=false \
--set git.url=git@github.com:YOURUSER/flux-get-started \
--namespace flux
```

# Install flux client for Mac with brew

```sh
brew install fluxctl
```

# fetch ssh pub key from flux and add it to the git repository

```sh
fluxctl identity --k8s-fwd-ns flux
```

Open GitHub, navigate to your fork, go to Setting > Deploy keys, click on Add deploy key, give it a Title, check Allow write access, paste the Flux public key and click Add key.

# fluxctl client commands

# show running controllers

```sh
fluxctl --k8s-fwd-ns flux list-workloads -a
```

# fetch ssh pub key from flux

```sh
fluxctl --k8s-fwd-ns flux identity
```

# force sync from git repo

```sh
fluxctl --k8s-fwd-ns flux sync
```

# automate mongodb helm release

```sh
fluxctl --k8s-fwd-ns flux automate -w demo:helmrelease/mongodb
```

