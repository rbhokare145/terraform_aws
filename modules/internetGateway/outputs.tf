output "internetgateway_name" {
  value = "${aws_internet_gateway.kubeInternetGateway.tags["Name"]}"
}

output "internetgateway_id" {
  value = "${aws_internet_gateway.kubeInternetGateway.id}"
}
