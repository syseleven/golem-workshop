variable "public_key_path" {
  description = "Enter the path to the SSH Public to use on your openstack servers"
  default = "~/.ssh/id_rsa.pub"
}

variable "region" {
  description = "Openstack region to launch servers."
  default     = "dbl"
}

variable "internal_cidr" {
  description = "Openstack network cidr for internal network"
  default     = "192.168.0.0/24"
}

variable "dns_resolver" {
  description = "Openstack dns resolver"
  default     = ["37.123.105.116", "37.123.105.117"]
}

variable "floating_ip_pool" {
  description = "Floating IP pool"
  default     = "ext-net"
}

variable "master_count" {
  description = "number of master nodes"
  default     = "1"
}

variable "master_assign_floating_ip" {
  default = "true"
}

variable "security_groups_master" {
  description = "security groups master nodes"
  default     = ["ssh-sec-group", "apiserver-sec-group", "default"]
}

variable "worker_count" {
  description = "number of worker nodes"
  default     = "3"
}

variable "worker_assign_floating_ip" {
  default = "true"
}

variable "security_groups_worker" {
  description = "security groups worker nodes"
  default     = ["ssh-sec-group", "default"]
}

variable "network_name" {
  default = "net-k8s"
}

variable "subnet_name" {
  default = "subnet-k8s"
}

variable "router_name" {
  default = "router-k8s"
}
