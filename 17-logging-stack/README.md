# Logging Stack

* Install ElasticSearch

```sh
helm upgrade --install elasticsearch stable/elasticsearch --namespace elastic-stack -f elasticsearch/values.yaml --set data.terminationGracePeriodSeconds=0
```

* Install FluentD

```sh
helm upgrade --install fluentd --namespace elastic-stack -f fluentd-elasticsearch/values.yaml stable/fluentd-elasticsearch
```

* Adapt Ingress hostnames in `kibana/values.yaml`
* Install Kibana

```sh
kubectl apply -f basic-auth.yaml
helm upgrade --install kibana --namespace elastic-stack stable/kibana -f kibana/values.yaml
```
