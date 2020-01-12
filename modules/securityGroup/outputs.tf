output "KubeSecurityGroupId" {
  value = "${aws_security_group.kubeSecurityGroup.id}"
}

output "KubeSecurityGroupName" {
  value = "${aws_security_group.kubeSecurityGroup.name}"
}