# Exercise

For the exercise app:

* Create a Dockerfile
* Build the docker image
* Test it locally
* Push it to Docker Hub or another registry

Or use bashofmann/exercise-app:1.0.0

* Create a Deployment
* Create a Service of type ClusterIP (no external LoadBalancer)
* Create an Ingress Resource that routes traffic to this Service and uses TLS
* Create a ConfigMap with a USERNAME and inject it into the Deployment as an environment variable

Bonus:

* Make the repository in the Docker registry private, see https://kubernetes.io/docs/tasks/configure-pod-container/pull-image-private-registry/
