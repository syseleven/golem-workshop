resource "aws_instance" "instance" {
  count = "${var.instance_count}"

  instance_type          = "${var.instance_type}"
  ami                    = "${lookup(var.aws_amis, var.aws_region)}"
  key_name               = "${var.key_pair_id}"
  vpc_security_group_ids = ["${var.security_group_id}"]
  subnet_id              = "${var.subnet_id}"
  iam_instance_profile   = "${var.aws_iam_profile}"

  root_block_device {
      volume_size = "${var.disk_size}"
  }

  tags = {
      Name = "${format("%s%02d", var.group_name, count.index + 1)}"
      Group = "${var.group_name}"
      KubernetesCluster = "${var.cluster_name}"
  }

  lifecycle {
    create_before_destroy = true
  }
}
