output "publicSubnet1_name" {
  value = "${aws_subnet.kubePublicSubnet1.tags}"
}

output "publicSubnet1_az" {
  value = "${aws_subnet.kubePublicSubnet1.availability_zone}"
}

output "publicSubnet1_id" {
  value = "${aws_subnet.kubePublicSubnet1.id}"
}

output "publicSubnet1_cidr" {

  value = "${aws_subnet.kubePublicSubnet1.cidr_block}"

}


output "publicSubnet2_name" {
  value = "${aws_subnet.kubePublicSubnet2.tags}"
}

output "publicSubnet2_az" {
  value = "${aws_subnet.kubePublicSubnet2.availability_zone}"
}

output "publicSubnet2_id" {
  value = "${aws_subnet.kubePublicSubnet2.id}"
}

output "publicSubnet2_cidr" {

  value = "${aws_subnet.kubePublicSubnet2.cidr_block}"

}


output "privateSubnet1_name" {
  value = "${aws_subnet.kubePrivateSubnet1.tags}"
}

output "privateSubnet1_az" {
  value = "${aws_subnet.kubePrivateSubnet1.availability_zone}"
}

output "privateSubnet1_id" {
  value = "${aws_subnet.kubePrivateSubnet1.id}"
}

output "privateSubnet1_cidr" {
  value = "${aws_subnet.kubePrivateSubnet1.cidr_block}"
}


output "privateSubnet2_name" {
  value = "${aws_subnet.kubePrivateSubnet2.tags}"
}

output "privateSubnet2_az" {
  value = "${aws_subnet.kubePrivateSubnet2.availability_zone}"
}

output "privateSubnet2_id" {
  value = "${aws_subnet.kubePrivateSubnet2.id}"
}

output "privateSubnet2_cidr" {
  value = "${aws_subnet.kubePrivateSubnet2.cidr_block}"
}
