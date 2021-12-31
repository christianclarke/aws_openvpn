resource "aws_instance" "openvpn" {
  ami           = var.openvpn_ami_id
  instance_type = var.instance_type
  key_name = var.key_name
  tags = var.openvpn_tags
  subnet_id = var.subnet_id
  security_groups = [aws_security_group.openvpn.id]
}

resource "aws_security_group" "openvpn" {
  description = "Allow OpenVPN traffic"
  vpc_id      = var.vpc_id

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = var.openvpn_tags
}

resource "aws_security_group_rule" "openvpn" {
  for_each = { for port in [945, 22, 943, 1194, 443]: port => port }
  type              = "ingress"
  from_port         = each.value
  to_port           = each.value
  protocol          = "tcp"
  cidr_blocks       = var.vpn_exposed_cidrs
  security_group_id = aws_security_group.openvpn.id
}
