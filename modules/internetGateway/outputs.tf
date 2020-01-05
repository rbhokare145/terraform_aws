output "internetgateway_name" {
  value = "${aws_internet_gateway.kubeInternetGateway.tags}"
}

output "internetgateway_id" {
  value = "${aws_internet_gateway.kubeInternetGateway.id}"
}
