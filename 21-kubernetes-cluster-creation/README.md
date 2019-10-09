# Kubernetes cluster creation

Prerequisites:

* terraform
* ansible
* aws or openstack account

# Configure terraform variables

* initialize validate and run terraform
* cd to the terraform aws or openstack directory

```
terraform init
```

```
terraform validate
```

```
terraform apply -parallelism=2
```

* terraform should create the complete infrastructure for you. Verifiy that everything has been created.

# Run ansible

* cd to the ansible directory. Edit the inventory file and add your servers
* run ansible

```
ansible-playbook -i inventory-kubeadm kubeadm.yml
```

* After the ansible run you will find you kubeconfig in the ansible directory kubeadm/admin.conf. You may use this file to connect to you kubernetes cluster

```
export KUBECONFIG=kubeadm/admin.conf
```


