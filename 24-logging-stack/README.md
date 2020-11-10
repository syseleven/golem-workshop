# Logging Stack

* Create namespace and install repo

```sh
kubectl create namespace <YOUR_NAME>-elastic-stack
helm repo add elastic https://helm.elastic.co/
```

* Install ElasticSearch

```sh
helm upgrade --install elasticsearch elastic/elasticsearch --namespace <YOUR_NAME>-elastic-stack --version 7.9.3 -f elasticsearch/values.yaml --set data.terminationGracePeriodSeconds=0
```

* Install FluentD

```sh
helm upgrade --install fluentd --namespace <YOUR_NAME>-elastic-stack -f fluentd-elasticsearch/values.yaml --version 2.4.1 bitnami/fluentd
```

* Adapt Ingress hostnames in `kibana/values.yaml`
* Install Kibana

```sh
kubectl apply -f basic-auth.yaml
helm upgrade --install kibana --namespace <YOUR_NAME>-elastic-stack --version 7.9.3 elastic/kibana -f kibana/values.yaml
```
