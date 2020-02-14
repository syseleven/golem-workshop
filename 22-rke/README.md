# Creating a cluster with rke

https://www.terraform.io/docs/index.html
https://rancher.com/docs/rke/latest/en/

Add SSH public key to `terraform/instance/cloud-init`.

Create VMs with terraform:

```
cd terraform
terraform plan
terraform apply
```

Add IPs from VMs to `rke/cluster.yml`.

Create cluster:

```
cd rke
rke up
```

Connect to cluster:

```
export KUBECONFIG=kube_config_cluster.yml
```

Show supported Kubernetes versions:

```
rke config --list-version --all
```

Update kubernetes version in `cluster.yml` and run again:

```
rke up
```
