output "key_id" {
  value = "${aws_key_pair.Kubenodekey.id}"
}

output "key_name" {
  value = "${aws_key_pair.Kubenodekey.key_name}"
}