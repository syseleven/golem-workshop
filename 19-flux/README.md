# Ensure that the service endpoint tiller-deploy is there otherwise
kubectl -n kube-system get svc
helm init --skip-refresh --upgrade --service-account tiller

# Add weaveworks repo to helm and update

helm repo add weaveworks https://weaveworks.github.io/flux
helm repo up

# Create ssh key pair and add to secret

ssh-keygen -q -N "" -f ./identity
kubectl create ns flux
kubectl -n flux create secret generic helm-ssh --from-file=./identity

# Install crd definitions

kubectl apply -f https://raw.githubusercontent.com/weaveworks/flux/master/deploy-helm/flux-helm-release-crd.yaml

# Install flux operator

helm install --name flux --namespace flux --set git.url=git@github.com:simon-k8s/flux-deployment --namespace flux --set git.secretName=helm-ssh --set helmOperator.create=true --set helmOperator.createCRD=false weaveworks/flux

# Install flux client for Mac with brew

brew install fluxctl

# fluxctl client commands

# show running controllers

fluxctl --k8s-fwd-ns flux list-controllers -a

# fetch ssh pub key from flux

fluxctl identity --k8s-fwd-ns flux

# force sync from git repo

fluxctl sync --k8s-fwd-ns flux

# automate nginx ingress deployment

fluxctl --k8s-fwd-ns flux automate --workspace=webapp:deployment/webapp
