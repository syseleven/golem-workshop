# Logging Stack

* Create namespace and install repo

```sh
helm repo add elastic https://helm.elastic.co/
```

* Install ElasticSearch

```sh
helm upgrade --install elasticsearch elastic/elasticsearch --version 7.9.3 --set data.terminationGracePeriodSeconds=0
```

* Install FluentD

```sh
helm upgrade --install fluentd --version 2.4.1 bitnami/fluentd
```

* Adapt Ingress hostnames in `kibana/values.yaml`
* Install Kibana

```sh
kubectl apply -f basic-auth.yaml
helm upgrade --install kibana --version 7.9.3 elastic/kibana
```
