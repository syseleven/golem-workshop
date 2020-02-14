provider "openstack" {
  region = "dbl"
  auth_url = "https://keystone.cloud.syseleven.net:5000/v3"
  domain_name = "Default"
}

data "openstack_networking_network_v2" "ext_net" {
  name = "ext-net"
}

resource "openstack_networking_network_v2" "rke" {
  name = "net.rke"
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "rke" {
  name = "subnet.rke"
  network_id = openstack_networking_network_v2.rke.id
  cidr = "192.168.0.0/24"
  ip_version = 4
  enable_dhcp = "true"
  dns_nameservers = ["37.123.105.116", "37.123.105.117"]
}

resource "openstack_networking_router_v2" "rke" {
  name = "router2ext.rke"
  admin_state_up = "true"
  external_network_id = data.openstack_networking_network_v2.ext_net.id
}

resource "openstack_networking_router_interface_v2" "rke" {
  router_id = openstack_networking_router_v2.rke.id
  subnet_id = openstack_networking_subnet_v2.rke.id
}

resource "openstack_compute_secgroup_v2" "rke-ssh-access" {
  name = "rke-ssh-access"
  description = "Security group for ssh access"

  rule {
    from_port = 22
    to_port = 22
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
  rule {
    from_port = 6443
    to_port = 6443
    ip_protocol = "tcp"
    cidr = "0.0.0.0/0"
  }
}

module "instance-one" {
  source = "./instance"

  ip_pool = data.openstack_networking_network_v2.ext_net.name
  network_name = openstack_networking_network_v2.rke.name
  security_groups = [
    "default",
    openstack_compute_secgroup_v2.rke-ssh-access.name
  ]
  flavor_name = "m1.small"
  name = "rke-instance-one"
}

module "instance-two" {
  source = "./instance"

  ip_pool = data.openstack_networking_network_v2.ext_net.name
  network_name = openstack_networking_network_v2.rke.name
  security_groups = [
    "default",
    openstack_compute_secgroup_v2.rke-ssh-access.name
  ]
  flavor_name = "m1.small"
  name = "rke-instance-two"
}
