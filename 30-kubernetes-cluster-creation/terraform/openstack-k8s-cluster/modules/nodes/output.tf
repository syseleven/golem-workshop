# Module outputs

output "local_ip_v4" {
  value = ["${openstack_compute_instance_v2.instance.*.network.0.fixed_ip_v4}"]
}

output "public_ip" {
  value = ["${openstack_compute_floatingip_v2.floating_ip.*.address}"]
}

output "hostnames" {
  value = ["${openstack_compute_instance_v2.instance.*.name}"]
}
