variable "public_key_path" {
  description = "Enter the path to the SSH Public to use on your openstack servers"
  default = "~/.ssh/id_rsa.pub"
}

variable "region" {
  description = "Openstack region to launch servers."
  default     = "dbl"
}

variable "image_name" {
  description = "Openstack image for all nodes"
  default     = "Ubuntu Bionic 18.04 (2019-09-18)"
}

variable "master_flavor" {
  description = "Openstack flavor for master nodes"
  default     = "m1.small"
}

variable "worker_flavor" {
  description = "Openstack flavor for worker nodes"
  default     = "m1.medium"
}

variable "internal_cidr" {
  description = "Openstack network cidr for internal network"
  default     = "192.168.0.0/24"
}

variable "dns_resolver" {
  description = "Openstack dns resolver"
  default     = ["37.123.105.116", "37.123.105.117"]
}
