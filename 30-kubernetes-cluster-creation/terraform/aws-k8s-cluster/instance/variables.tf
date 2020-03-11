variable "aws_amis" {
  default = {
    eu-central-1 = "ami-0bdf93799014acdc4"
  }
}

variable "disk_size" {
  default = 8
}

variable "instance_count" {
  default = 1
}

variable "group_name" {
  description = "Group name becomes the base of the hostname of the instance"
}

variable "aws_iam_profile" {
  description = "Group name becomes the base of the hostname of the instance"
}

variable "cluster_name" {
  description = "Kubernetes cluster name for the instance tag"
  default = "kubernetes"
}

variable "aws_region" {
  description = "AWS region to launch servers."
  default     = "eu-central-1"
}

variable "instance_type" {
  description = "AWS region to launch servers."
  default     = "t2.medium"
}

variable "subnet_id" {
  description = "ID of the AWS VPC subnet to use"
}

variable "key_pair_id" {
  description = "ID of the keypair to use for SSH"
}

variable "security_group_id" {
  description = "ID of the VPC security group to use for network"
}
