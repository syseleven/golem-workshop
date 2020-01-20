# Openstack configuration

provider "openstack" {
  domain_name = "default"
  region      = var.region
}

# Network configuration

data "openstack_networking_network_v2" "ext_net" {
  name = "ext-net"
}

resource "openstack_networking_network_v2" "network" {
  name           = var.network_name
  admin_state_up = "true"
}

resource "openstack_networking_subnet_v2" "network" {
  name            = var.subnet_name
  network_id      = openstack_networking_network_v2.network.id
  cidr            = var.internal_cidr
  ip_version      = 4
  enable_dhcp     = "true"
  dns_nameservers = var.dns_resolver
}

resource "openstack_networking_router_v2" "network" {
  name                = var.router_name
  admin_state_up      = "true"
  external_network_id = data.openstack_networking_network_v2.ext_net.id
}

resource "openstack_networking_router_interface_v2" "network" {
  router_id = openstack_networking_router_v2.network.id
  subnet_id = openstack_networking_subnet_v2.network.id
}

# Security Groups

resource "openstack_compute_secgroup_v2" "ssh_access_secgroup" {
  name        = "ssh-sec-group"
  description = "Security group for ssh access"

  rule {
    from_port   = 22
    to_port     = 22
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}

resource "openstack_compute_secgroup_v2" "apiserver_access_secgroup" {
  name        = "apiserver-sec-group"
  description = "Security group for API server access"

  rule {
    from_port   = 6443
    to_port     = 6443
    ip_protocol = "tcp"
    cidr        = "0.0.0.0/0"
  }
}

# Upload SSH key

resource "openstack_compute_keypair_v2" "ssh_key" {
  name       = "ssh-pubkey"
  public_key = file(var.public_key_path)
}

# Master node configuration

module "master-nodes" {
  source      = "./modules/nodes"
  key_pair_id = openstack_compute_keypair_v2.ssh_key.name
  node_count  = var.master_count
  flavor_name = "m1.small"
  group_name  = "master"

  # Network settings
  network_name       = var.network_name
  security_groups    = var.security_groups_master
  assign_floating_ip = var.master_assign_floating_ip
  floating_ip_pool   = var.floating_ip_pool
}

# Worker node configuration

module "worker-nodes" {
  source      = "./modules/nodes"
  key_pair_id = openstack_compute_keypair_v2.ssh_key.name
  node_count  = var.worker_count
  group_name  = "worker"

  # Network settings
  network_name       = var.network_name
  security_groups    = var.security_groups_worker
  assign_floating_ip = var.worker_assign_floating_ip
  floating_ip_pool   = var.floating_ip_pool
}

