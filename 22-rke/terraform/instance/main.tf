variable "name" {
  default = ""
}
variable "flavor_name" {
  default = ""
}
variable "network_name" {
  default = ""
}
variable "ip_pool" {
  default = ""
}
variable "security_groups" {
  default = ""
}

resource "openstack_compute_instance_v2" "rke" {
  name = var.name
  image_name = "Ubuntu Bionic 18.04 (2020-02-11)"
  flavor_name = var.flavor_name
  user_data = file("instance/cloud-init")
  security_groups = var.security_groups
  network {
    name = var.network_name
  }
}

resource "openstack_compute_floatingip_associate_v2" "rke-floating-ip-assoc" {
  instance_id = openstack_compute_instance_v2.rke.id
  floating_ip = openstack_networking_floatingip_v2.rke-floating-ip.address
}

resource "openstack_networking_floatingip_v2" "rke-floating-ip" {
  pool = var.ip_pool
}
