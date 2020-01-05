output "cidr_output" {
  value = "${aws_vpc.kubeVpc.cidr_block}"
  description = "configured CIDR range"
}

output "kubeVpc_id" {
  value = "${aws_vpc.kubeVpc.id}"
  description = "vpc id of the main vpc"
}

output "kubeVpc_name" {
  value = "${aws_vpc.kubeVpc.tags}"
}

output "kubeVpc_routetableid" {
  value = "${aws_vpc.kubeVpc.main_route_table_id}"
}
