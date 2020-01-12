resource "aws_instance" "jumbBox" {
    ami = "${var.ami_id}"
    instance_type = "${var.ec2_type}"
    availability_zone = "${var.availibility_zone}"
    security_groups = ["${var.security_groupId}"]
    key_name = "${var.key_name}"
    subnet_id = "${var.public_subnet_id}"
    associate_public_ip_address = true
    tags = {
      Name = "jumpMaster"
  }
}

resource "aws_instance" "kubeMaster" {
    ami = "${var.ami_id}"
    instance_type = "${var.ec2_type}"
    availability_zone = "${var.availibility_zone}"
    security_groups = ["${var.security_groupId}"]
    key_name = "${var.key_name}"
    subnet_id = "${var.private_subnet_id}"
    tags = {
      Name = "KubeMaster"
  }
}

resource "aws_instance" "kubeNode1" {
    ami = "${var.ami_id}"
    instance_type = "${var.ec2_type}"
    availability_zone = "${var.availibility_zone}"
    security_groups = ["${var.security_groupId}"]
    key_name = "${var.key_name}"
    subnet_id = "${var.private_subnet_id}"
    tags = {
      Name = "KubeNode1"
  }
}

resource "aws_instance" "kubeNode2" {
    ami = "${var.ami_id}"
    instance_type = "${var.ec2_type}"
    availability_zone = "${var.availibility_zone}"
    security_groups = ["${var.security_groupId}"]
    key_name = "${var.key_name}"
    subnet_id = "${var.private_subnet_id}"
    tags = {
      Name = "KubeNode2"
  }
}






