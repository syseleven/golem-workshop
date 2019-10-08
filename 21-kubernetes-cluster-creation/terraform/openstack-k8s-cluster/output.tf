# Node module output

output "master_private_ip" {
  value = "${module.master-nodes.local_ip_v4}"
}

output "worker_private_ip" {
  value = "${module.worker-nodes.local_ip_v4}"
}

output "master_public_ip" {
  value = "${module.master-nodes.public_ip}"
}

output "worker_public_ip" {
  value = "${module.worker-nodes.public_ip}"
}

output "master_hostnames" {
  value = "${module.master-nodes.hostnames}"
}

output "worker_hostnames" {
  value = "${module.worker-nodes.hostnames}"
}
