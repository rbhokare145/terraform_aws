resource "aws_network_acl" "kubeNetworkAcl" {
  vpc_id = "${var.vpc_id}"

  egress {
    action = "allow"
    from_port = 0
    protocol = -1
    cidr_block = "0.0.0.0/0"
    rule_no = 100
    to_port = 0
  }

  ingress {
    action = "allow"
    from_port = 22
    protocol = "tcp"
    cidr_block = "${var.cidr_range}"
    rule_no = 50
    to_port = 22
  }

  ingress {
    action = "allow"
    from_port = 443
    protocol = "tcp"
    cidr_block = "${var.cidr_range}"
    rule_no = 51
    to_port = 443
  }

   ingress {
    action = "allow"
    from_port = 80
    protocol = "tcp"
    cidr_block = "${var.cidr_range}"
    rule_no = 52
    to_port = 80
  }

   ingress {
    action = "allow"
    from_port = 22
    protocol = "tcp"
    cidr_block = "${var.user_iprange}"
    rule_no = 53
    to_port = 22
  }


  tags = {
    Name = "Kube_acl"
  }
}