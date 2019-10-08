# Elastic Load Balancer output

output "master_address" {
  value = "${aws_elb.master.dns_name}"
}
