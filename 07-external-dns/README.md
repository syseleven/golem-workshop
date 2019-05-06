# 7. External DNS

* Install Helm: https://docs.helm.sh/using_helm/#installing-helm
```
helm init --client-only
helm repo update
```
* Change `digitalocean.apiToken` in values.yaml
* Change `txtOwnerId` in values.yaml
* Install external-dns with Helm
```
helm install --name external-dns --namespace=external-dns -f values.yaml stable/external-dns
```
