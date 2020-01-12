output "jumbBox_instanceName" {
  value = "${aws_instance.jumbBox.tags}"
}

output "jumpBox_instanceId" {
  value = "${aws_instance.jumbBox.id}"
}

output "jumbBox_instancePublicIp" {
  value = "${aws_instance.jumbBox.public_ip}"
}

output "kubeMaster_instanceName" {
  value = "${aws_instance.kubeMaster.tags}"
}

output "kubeMaster_instanceId" {
  value = "${aws_instance.kubeMaster.id}"
}

output "kubeNode1_instanceName" {
  value = "${aws_instance.kubeNode1.tags}"
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
