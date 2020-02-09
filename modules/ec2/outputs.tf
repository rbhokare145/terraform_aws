output "jumbBox_instanceName" {
  value = "${aws_instance.jumpBox.tags}"
}

output "jumpBox_instanceId" {
  value = "${aws_instance.jumpBox.id}"
}

output "jumbBox_instancePublicIp" {
  value = "${aws_instance.jumpBox.public_ip}"
}

output "kubeMaster_instanceName" {
  value = "${aws_instance.kubeMaster.tags}"
}

output "kubeMaster_instanceId" {
  value = "${aws_instance.kubeMaster.id}"
}

output "kubeMaster_instanceIp" {
  value = "${aws_instance.kubeMaster.private_ip}"
}


output "kubeNode1_instanceName" {
  value = "${aws_instance.kubeNode1.tags}"
}

output "kubeNode1_instanceIp" {
  value = "${aws_instance.kubeNode1.private_ip}"
}

output "kubeNode1_instanceId" {
  value = "${aws_instance.kubeNode1.id}"
}

output "kubeNode2_instanceName" {
  value = "${aws_instance.kubeNode2.tags}"
}

output "kubeNode2_instanceId" {
  value = "${aws_instance.kubeNode2.id}"
}

output "kubeNode2_instanceIp" {
  value = "${aws_instance.kubeNode2.private_ip}"
}
