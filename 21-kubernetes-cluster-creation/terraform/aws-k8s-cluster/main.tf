provider "aws" {
  region = "${var.aws_region}"
}

# Network configuration

resource "aws_vpc" "vpc_main" {
  cidr_block = "10.0.0.0/16"

  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "Main VPC"
    KubernetesCluster = "kubernetes"
  }
}

resource "aws_internet_gateway" "default" {
  vpc_id = "${aws_vpc.vpc_main.id}"
}

resource "aws_route" "internet_access" {
  route_table_id          = "${aws_vpc.vpc_main.main_route_table_id}"
  destination_cidr_block  = "0.0.0.0/0"
  gateway_id              = "${aws_internet_gateway.default.id}"
}

# Create a public subnet to launch our load balancers
resource "aws_subnet" "public" {
  vpc_id                  = "${aws_vpc.vpc_main.id}"
  cidr_block              = "10.0.1.0/24" # 10.0.1.0 - 10.0.1.255 (256)
  map_public_ip_on_launch = true
}

# Create a private subnet to launch our worker and master nodes
resource "aws_subnet" "private" {
  vpc_id                  = "${aws_vpc.vpc_main.id}"
  cidr_block              = "10.0.16.0/20" # 10.0.16.0 - 10.0.31.255 (4096)
  map_public_ip_on_launch = true
}

# Security Groups

# A security group for the ELB so it is accessible via the web
resource "aws_security_group" "elb" {
  name        = "sec_group_elb"
  description = "Security group for public facing ELBs"
  vpc_id      = "${aws_vpc.vpc_main.id}"

  # HTTP access from anywhere
  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# security group to access the master nodes over SSH and the API Port
resource "aws_security_group" "master" {
  name        = "sec_group_master"
  description = "Security group for Master nodes"
  vpc_id      = "${aws_vpc.vpc_main.id}"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # API access from the VPC
  ingress {
    from_port   = 6443
    to_port     = 6443
    protocol    = "tcp"
    cidr_blocks = ["10.0.0.0/16"]
  }

  # Allow all from private subnet
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${aws_subnet.private.cidr_block}"]
  }

  # Outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# security group to access the worker nodes over SSH
resource "aws_security_group" "worker" {
  name        = "sec_group_worker"
  description = "Security group for Worker nodes"
  vpc_id      = "${aws_vpc.vpc_main.id}"

  # SSH access from anywhere
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # Allow all from private subnet
  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["${aws_subnet.private.cidr_block}"]
  }

  # Outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# SSH Key pair

resource "aws_key_pair" "auth" {
  key_name   = "default"
  public_key = "${file(var.public_key_path)}"
}

# EC2 Instances

module "master_nodes" {
    source                 = "./instance"
    subnet_id              = "${aws_subnet.private.id}"
    key_pair_id            = "${aws_key_pair.auth.id}"
    security_group_id      = "${aws_security_group.master.id}"

    instance_count         = "1"
    group_name             = "master"
    aws_iam_profile        = "master-role"
}

module "worker_nodes" {
    source                 = "./instance"
    subnet_id              = "${aws_subnet.private.id}"
    key_pair_id            = "${aws_key_pair.auth.id}"
    security_group_id      = "${aws_security_group.worker.id}"

    instance_count         = "3"
    group_name             = "worker"
    instance_type          = "t2.large"
    aws_iam_profile        = "node-role"
}

# Load Balancers. Uses the instance module outputs.

# Public Master ELB
resource "aws_elb" "master" {
  name = "elb-public-master"

  subnets              = ["${aws_subnet.public.id}", "${aws_subnet.private.id}"]
  security_groups      = ["${aws_security_group.elb.id}"]
  instances            = "${module.master_nodes.instance_ids}"

  listener {
   instance_port       = 6443
   instance_protocol   = "tcp"
   lb_port             = 6443
   lb_protocol         = "tcp"
  }

  health_check {
   healthy_threshold   = 2
   unhealthy_threshold = 2
   timeout             = 3
   target              = "TCP:6443"
   interval            = 30
  }
}
