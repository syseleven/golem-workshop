# Openstack configuration

provider "openstack" {
  domain_name = "default"
  region = "${var.region}"
}

# Network configuration

data "openstack_networking_network_v2" "ext_net" {
  name = "ext-net"
}

    resource "openstack_networking_network_v2" "terraform" {
      name = "net.k8s"
      admin_state_up = "true"
    }

    resource "openstack_networking_subnet_v2" "terraform" {
      name = "subnet.k8s"
      network_id = "${openstack_networking_network_v2.terraform.id}"
      cidr = "${var.internal_cidr}"
      ip_version = 4
      enable_dhcp = "true"
      dns_nameservers = "${var.dns_resolver}"
    }

    resource "openstack_networking_router_v2" "terraform" {
      name = "router.k8s"
      admin_state_up = "true"
      external_network_id = "${data.openstack_networking_network_v2.ext_net.id}"
    }

    resource "openstack_networking_router_interface_v2" "terraform" {
      router_id = "${openstack_networking_router_v2.terraform.id}"
      subnet_id = "${openstack_networking_subnet_v2.terraform.id}"
    }


# Security Groups

resource "openstack_compute_secgroup_v2" "ssh_access_secgroup" {
  name = "ssh_access.secgroup"
  description = "Security group for ssh access"

   rule {
     from_port = 22
     to_port = 22
     ip_protocol = "tcp"
     cidr = "0.0.0.0/0"
   }
}

resource "openstack_compute_secgroup_v2" "apiserver_access_secgroup" {
  name = "apiserver_access.secgroup"
  description = "Security group for K8s API server access"

   rule {
     from_port = 6443
     to_port = 6443
     ip_protocol = "tcp"
     cidr = "0.0.0.0/0"
   }
}

# Master node configuration

resource "openstack_compute_instance_v2" "master0" {
  name = "master0"
  image_name = "${var.image_name}"
  flavor_name = "${var.master_flavor}"
  key_pair = "${openstack_compute_keypair_v2.ssh_key.name}"

  security_groups = [
      "default",
      "${openstack_compute_secgroup_v2.ssh_access_secgroup.name}",
      "${openstack_compute_secgroup_v2.apiserver_access_secgroup.name}"
  ]

  network {
    uuid = "${openstack_networking_network_v2.terraform.id}"
  }

  connection {
    user = "ubuntu"
  }

  metadata = {
    Group = "master"
    NodeNumber = "0"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = ["flavor_name","image_name"]
  }
}

# Create a floating ip
resource "openstack_networking_floatingip_v2" "master0_ip" {
  pool = "ext-net"
}

# associate the floating ip
resource "openstack_compute_floatingip_associate_v2" "master0_ip" {
  floating_ip = "${openstack_networking_floatingip_v2.master0_ip.address}"
  instance_id = "${openstack_compute_instance_v2.master0.id}"
}

# Worker node configuration

resource "openstack_compute_instance_v2" "worker0" {
  name = "worker0"
  image_name = "${var.image_name}"
  flavor_name = "${var.worker_flavor}"
  key_pair = "${openstack_compute_keypair_v2.ssh_key.name}"

  security_groups = [
      "default",
      "${openstack_compute_secgroup_v2.ssh_access_secgroup.name}",
  ]

  network {
    uuid = "${openstack_networking_network_v2.terraform.id}"
  }

  connection {
    user = "ubuntu"
  }

  metadata = {
    Group = "worker"
    NodeNumber = "0"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = ["flavor_name","image_name"]
  }
}

# Create a floating ip
resource "openstack_networking_floatingip_v2" "worker0_ip" {
  pool = "ext-net"
}

# associate the floating ip
resource "openstack_compute_floatingip_associate_v2" "worker0_ip" {
  floating_ip = "${openstack_networking_floatingip_v2.worker0_ip.address}"
  instance_id = "${openstack_compute_instance_v2.worker0.id}"
}


resource "openstack_compute_instance_v2" "worker1" {
  name = "worker1"
  image_name = "${var.image_name}"
  flavor_name = "${var.worker_flavor}"
  key_pair = "${openstack_compute_keypair_v2.ssh_key.name}"

  security_groups = [
      "default",
      "${openstack_compute_secgroup_v2.ssh_access_secgroup.name}",
  ]

  network {
    uuid = "${openstack_networking_network_v2.terraform.id}"
  }

  connection {
    user = "ubuntu"
  }

  metadata = {
    Group = "worker"
    NodeNumber = "1"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = ["flavor_name","image_name"]
  }
}

# Create a floating ip
resource "openstack_networking_floatingip_v2" "worker1_ip" {
  pool = "ext-net"
}

# associate the floating ip
resource "openstack_compute_floatingip_associate_v2" "worker1_ip" {
  floating_ip = "${openstack_networking_floatingip_v2.worker1_ip.address}"
  instance_id = "${openstack_compute_instance_v2.worker1.id}"
}


resource "openstack_compute_instance_v2" "worker2" {
  name = "worker2"
  image_name = "${var.image_name}"
  flavor_name = "${var.worker_flavor}"
  key_pair = "${openstack_compute_keypair_v2.ssh_key.name}"

  security_groups = [
      "default",
      "${openstack_compute_secgroup_v2.ssh_access_secgroup.name}",
  ]

  network {
    uuid = "${openstack_networking_network_v2.terraform.id}"
  }

  connection {
    user = "ubuntu"
  }

  metadata = {
    Group = "worker"
    NodeNumber = "2"
  }

  lifecycle {
    create_before_destroy = true
    ignore_changes = ["flavor_name","image_name"]
  }
}

# Create a floating ip
resource "openstack_networking_floatingip_v2" "worker2_ip" {
  pool = "ext-net"
}

# associate the floating ip
resource "openstack_compute_floatingip_associate_v2" "worker2_ip" {
  floating_ip = "${openstack_networking_floatingip_v2.worker2_ip.address}"
  instance_id = "${openstack_compute_instance_v2.worker2.id}"
}


# Upload SSH key

resource "openstack_compute_keypair_v2" "ssh_key" {
  name = "ssh_pubkey"
  public_key = "${file(var.public_key_path)}"
}
