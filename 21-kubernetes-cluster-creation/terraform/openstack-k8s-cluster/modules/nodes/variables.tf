variable "image_name" {
  description = "Openstack image for all nodes"
  default     = "Ubuntu Bionic 18.04 (2020-01-17)"
}

variable "flavor_name" {
  description = "Openstack default flavor for nodes"
  default     = "m1.medium"
}

variable "node_count" {
  default = {}
}

variable "floating_ip_pool" {
  default = {}
}

variable "assign_floating_ip" {
  default = "false"
}

variable "security_groups" {
  default = {}
}

variable "network_name" {
  default = {}
}

variable "group_name" {
  description = "The group name is used as a base for the hostname"
}

variable "key_pair_id" {
  description = "ID of the keypair to use for SSH"
}
