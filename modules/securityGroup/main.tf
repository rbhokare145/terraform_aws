resource "aws_security_group" "kubeSecurityGroup" {
  name = "KubeSecurityGroup"
  vpc_id = "${var.vpc_id}"

  ingress {
    from_port = 443
    protocol = "tcp"
    to_port = 443
    cidr_blocks = ["${var.cidr_range}"]
  }

  ingress {
    from_port = 80
    protocol = "tcp"
    to_port = 80
    cidr_blocks = ["${var.cidr_range}"]
  }

  ingress {
    from_port = 22
    protocol = "tcp"
    to_port = 22
    cidr_blocks = ["${var.cidr_range}"]
  }

  egress {
    from_port = 0
    protocol =  -1
    to_port = 0
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Kube_SecurityGroup"
  }

}