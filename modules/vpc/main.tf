resource "aws_vpc" "kubeVpc" {
  cidr_block = "${var.cidr_range}"
  enable_dns_hostnames = "true"
  enable_dns_support = "true"


  tags = {

    Name = "kubeNetVpc"

  }
}
