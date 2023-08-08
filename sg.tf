resource "aws_security_group" "instance_security_group" {
  name_prefix = "instance_sg_"
  #   name = "allow_tls"
  description = "Allow TLS Inbound and outbound trraffic"
  dynamic "ingress" {
    for_each = var.ports
    iterator = port
    content {
      description = "TLS for vpc"
      from_port   = port.value
      to_port     = port.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
