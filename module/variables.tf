variable "openvpn_ami_id" {
    type = string
    default = "ami-0e1415fedc1664f51"
}

variable "openvpn_tags" {
    type = map
}

variable "key_name" {
    type = string
}

variable "instance_type" {
    type = string
    default = "t2.micro"
}

variable "aws_region" {
    type = string
}
// ami-0e1415fedc1664f51
variable "aws_profile" {
    type = string
}

variable "subnet_id" {
    type = string
}

variable "vpc_id" {
    type = string
}

variable "vpn_exposed_cidrs" {
    type = list
}
