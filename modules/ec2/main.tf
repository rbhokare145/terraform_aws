data "template_file" "userdata_mini_1" {
  template = "${file("${path.module}/userdata_mini_1.tpl")}"
}

data "template_file" "userdata_mini_2" {
  template = "${file("${path.module}/userdata_mini_2.tpl")}"
}

data "template_file" "userdata_master" {
  template = "${file("${path.module}/userdata_master.tpl")}"
}

data "template_file" "jump_box" {
  template = "${file("${path.module}/jump_box.tpl")}"
}

resource "aws_instance" "jumpBox" {
    ami = "${var.ami_id}"
    instance_type = "${var.ec2_type}"
    availability_zone = "${var.availibility_zone}"
    security_groups = ["${var.security_groupId}"]
    key_name = "${var.key_name}"
    subnet_id = "${var.public_subnet_id}"
    associate_public_ip_address = true
    user_data = "${data.template_file.jump_box.rendered}"

    connection {
       type     = "ssh"
       user     = "ubuntu"
       private_key = "${file("~/.ssh/id_rsa")}"
       host     =  "${aws_instance.jumpBox.public_ip}"
       agent = false
    }

    provisioner "file" {
        source = "${path.module}/kubeconfig.sh"
        destination = "/$HOME/kubeconfig.sh"
    }

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

    connection {
       type     = "ssh"
       user     = "ubuntu"
       bastion_host = "${aws_instance.jumpBox.public_ip}"
       bastion_private_key = "${file("~/.ssh/id_rsa")}"
       private_key = "${file("~/.ssh/id_rsa")}"
       host     =  "${aws_instance.kubeMaster.private_ip}"
       agent = false
    }

     provisioner "file" {
       source = "${path.module}/kubemaster.sh"
       destination = "/$HOME/kubemaster.sh"
     }

      provisioner "file" {
        source = "${path.module}/kubeconfig.sh"
        destination = "/$HOME/kubeconfig.sh"
     }

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
    user_data = "${data.template_file.userdata_mini_1.rendered}"
    connection {
       type     = "ssh"
       user     = "ubuntu"
       bastion_host = "${aws_instance.jumpBox.public_ip}"
       bastion_private_key = "${file("~/.ssh/id_rsa")}"
       private_key = "${file("~/.ssh/id_rsa")}"
       host     =  "${aws_instance.kubeNode1.private_ip}"
       agent = false
    }

    provisioner "file" {
       source = "${path.module}/kubemini.sh"
       destination = "/$HOME/kubemini.sh"
    }
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
    user_data = "${data.template_file.userdata_mini_2.rendered}"
    connection {
       type     = "ssh"
       user     = "ubuntu"
       bastion_host = "${aws_instance.jumpBox.public_ip}"
       bastion_private_key = "${file("~/.ssh/id_rsa")}"
       private_key = "${file("~/.ssh/id_rsa")}"
       host     =  "${aws_instance.kubeNode2.private_ip}"
       agent = false
    }

    provisioner "file" {
       source = "${path.module}/kubemini.sh"
       destination = "/$HOME/kubemini.sh"
    }
    tags = {
      Name = "KubeNode2"
    }
}
