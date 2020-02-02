data "template_file" "userdata_mini" {
  template = "${file("${path.module}/userdata_mini.tpl")}"
}

data "template_file" "userdata_master" {
  template = "${file("${path.module}/userdata_master.tpl")}"
}

resource "aws_instance" "jumpBox" {
    ami = "${var.ami_id}"
    instance_type = "${var.ec2_type}"
    availability_zone = "${var.availibility_zone}"
    security_groups = ["${var.security_groupId}"]
    key_name = "${var.key_name}"
    subnet_id = "${var.public_subnet_id}"
    associate_public_ip_address = true
    tags = {
      Name = "JumbBox"
  }
}

resource "aws_instance" "kubeMaster" {
    ami = "${var.ami_id}"
    instance_type = "${var.ec2_type}"
    availability_zone = "${var.availibility_zone}"
    security_groups = ["${var.security_groupId}"]
    key_name = "${var.key_name}"
    subnet_id = "${var.private_subnet_id}"
    user_data = "${data.template_file.userdata_master.rendered}"
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
    user_data = "${data.template_file.userdata_mini.rendered}"
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
    #user_data = "${data.template_file.userdata_mini.rendered}"
    tags = {
      Name = "KubeNode2"
  }
}
