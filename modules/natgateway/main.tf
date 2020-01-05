resource "aws_nat_gateway" kubeNatGateway {
  allocation_id = "${var.eip_allocationid}"
  subnet_id = "${var.public_subnetid}"
  tags = {
    Name = "Kube_NatGateway"
  }
}
