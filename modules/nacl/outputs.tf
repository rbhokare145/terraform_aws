output "nacl_id" {
  value = "${aws_network_acl.kubeNetworkAcl.id}"
}

output "nacl_name" {
  value = "${aws_network_acl.kubeNetworkAcl.tags["Name"]}"
}