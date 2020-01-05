output "nat_id" {
  value = "${aws_nat_gateway.kubeNatGateway.id}"
}

output "nat_name" {
  value = "${aws_nat_gateway.kubeNatGateway.id}"
}

output "nat_publicip" {
  value = "${aws_nat_gateway.kubeNatGateway.public_ip}"
}
