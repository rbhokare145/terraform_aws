resource "aws_subnet" "kubePublicSubnet1" {
  cidr_block = "${var.pub1_cidr_range}"
  vpc_id = "${var.vpc_id}"

  tags = {
    Name = "KubePublic_Subnet1"
  }
}

resource "aws_subnet" "kubePublicSubnet2" {
  cidr_block = "${var.pub2_cidr_range}"
  vpc_id = "${var.vpc_id}"
  tags = {
    Name = "KubePublic_Subnet2"
  }
 }

resource "aws_subnet" "kubePrivateSubnet1" {
  cidr_block = "${var.pri1_cidr_range}"
  vpc_id = "${var.vpc_id}"
  tags = {
    Name = "KubePrivate_Subnet1"
  }
}

resource "aws_subnet" "kubePrivateSubnet2" {
  cidr_block = "${var.pri2_cidr_range}"
  vpc_id = "${var.vpc_id}"
  tags = {
    Name = "KubePrivate_Subnet2"
  }
}



