output "eip_name" {
  value = "${aws_eip.kubeeip.tags}"
}

output "eip_allocationid" {
  value = "${aws_eip.kubeeip.id}"
}
