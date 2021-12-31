variable "openvpn_ami_id" {}
variable "aws_region" {}
variable "aws_profile" {}
variable "openvpn_tags" {}
variable "key_name" {}
variable "vpc_id" {}
variable "subnet_id" {}
variable "vpn_exposed_cidrs" {}
variable "instance_type" {}

module "openvpn" {
  source = "../module"
  instance_type = var.instance_type
  openvpn_ami_id = var.openvpn_ami_id
  aws_region = var.aws_region
  aws_profile = var.aws_profile
  openvpn_tags = var.openvpn_tags
  key_name = var.key_name
  vpc_id = var.vpc_id
  subnet_id = var.subnet_id
  vpn_exposed_cidrs = var.vpn_exposed_cidrs
}
