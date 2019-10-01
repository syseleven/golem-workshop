# 7. External DNS

* Install Helm: https://docs.helm.sh/using_helm/#installing-helm
```
helm init --client-only
helm repo update
```
* Change openstack credentials in values.yaml
* Change `txtOwnerId` in values.yaml
* Install external-dns with Helm
```
helm upgrade --install external-dns --namespace=external-dns -f values.yaml stable/external-dns
```
