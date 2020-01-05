# To create private RT

resource "aws_route_table" "kubePrivateRt" {
    vpc_id = "${var.vpc_id}"
    tags = {
      Name = "Kube_PrivateRT"
    }
}

# To create private RT association
resource "aws_route_table_association" "kubePrivateRt1Ass" {
   subnet_id = "${var.private_sub1_id}"
   route_table_id = "${var.private_routable_id}"
}

resource "aws_route_table_association" "kubePrivateRt2Ass" {
   subnet_id = "${var.private_sub2_id}"
   route_table_id = "${var.private_routable_id}"
}


# To create public RT

resource "aws_route_table" "kubePublicRt" {
    vpc_id = "${var.vpc_id}"
    tags = {
      Name = "Kube_PublicRT"
    }
}

# To create private RT association

resource "aws_route_table_association" "kubePublicRt1Ass" {
   subnet_id = "${var.public_sub1_id}"
   route_table_id = "${var.public_routable_id}"
}

resource "aws_route_table_association" "kubePublicRt2Ass" {
   subnet_id = "${var.public_sub2_id}"
   route_table_id = "${var.public_routable_id}"
}

# To add PrivateRT for NatGatway

resource "aws_route" "kubePrivateRoutenat" {
  route_table_id = "${var.private_routable_id}"
  destination_cidr_block = "0.0.0.0/0"
  nat_gateway_id = "${var.nat_gw_id}"
}

# To add PublicRT for InternetGateway

resource "aws_route" "kubePublicRouteigw" {
  route_table_id = "${var.public_routable_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = "${var.igw_id}"
}
