# Openstack node module

# Node configuration

  resource "openstack_compute_instance_v2" "instance" {
    count         = "${var.node_count}"

  name            = "${format("%s%02d", var.group_name, count.index + 1)}"
  image_name      = "${var.image_name}"
  flavor_name     = "${var.flavor_name}"
  key_pair        = "${var.key_pair_id}"

  connection {
    user = "ubuntu"
  }

  metadata = {
    Group  = "${var.group_name}"
    name   = "${format("%s%02d", var.group_name, count.index + 1)}"
  }

  network {
    name = "${var.network_name}"
  }

  security_groups = "${var.security_groups}"

  lifecycle {
    create_before_destroy = true
    ignore_changes = ["flavor_name","image_name"]
  }
}

# Allocate floating IPs (optional)

  resource "openstack_compute_floatingip_v2" "floating_ip" {
    count = "${var.assign_floating_ip ? var.node_count : 0}"
    pool  = "${var.floating_ip_pool}"
  }

# Associate floating IPs (if created)

  resource "openstack_compute_floatingip_associate_v2" "floating_ip" {
    count       = "${var.assign_floating_ip ? var.node_count : 0}"
    floating_ip = "${element(openstack_compute_floatingip_v2.floating_ip.*.address, count.index)}"
    instance_id = "${element(openstack_compute_instance_v2.instance.*.id, count.index)}"
  }
