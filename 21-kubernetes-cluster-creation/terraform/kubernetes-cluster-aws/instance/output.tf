# Used for configuring ELBs.
output "instance_ids" {
    value = "${aws_instance.instance.*.id}"
}

output "instance_subnet_id" {
  value = "${aws_instance.instance.*.subnet_id}"
}
