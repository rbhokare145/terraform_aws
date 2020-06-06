output "private_routable_name" {
  value = "${aws_route_table.kubePrivateRt.tags["Name"]}"
}

output "private_routable_id"{
  value = "${aws_route_table.kubePrivateRt.id}"
}

output "public_routable_id" {
  value = "${aws_route_table.kubePublicRt.id}"
}
