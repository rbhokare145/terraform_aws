resource "aws_network_interface" "kubeMasterStatic" {
  subnet_id = "${var.private_subnet_id}"
  security_groups = ["${var.security_groupId}"]
  attachment {
    device_index = 1
    instance = "${var.kubemaster_instance}"
  }
  tags = {
    Name = "KubeMasterStatic"
  }
}