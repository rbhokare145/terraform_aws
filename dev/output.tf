#output VPC related INFO

output "vpc_name" {
  value = "${module.kubeVpc.kubeVpc_name}"
}

output "vpc_id" {
  value = "${module.kubeVpc.kubeVpc_id}"
}

output "vpc_cidr" {
  value = "${module.kubeVpc.cidr_output}"
}

output "vpc_routetableid" {
  value = "${module.kubeVpc.kubeVpc_routetableid}"
}

#output SUBNET related INFO

output "public_subnet1_name" {
  value = "${module.kubeSubnet.publicSubnet1_name}"
}

output "public_subnet1_id" {
  value = "${module.kubeSubnet.publicSubnet1_id}"
}

output "public_subnet1_zone" {
  value = "${module.kubeSubnet.publicSubnet1_az}"
}

output "public_subnet1_cidr" {
  value = "${module.kubeSubnet.publicSubnet1_cidr}"
}



output "public_subnet2_name" {
  value = "${module.kubeSubnet.publicSubnet2_name}"
}

output "public_subnet2_id" {
  value = "${module.kubeSubnet.publicSubnet2_id}"
}

output "public_subnet2_zone" {
  value = "${module.kubeSubnet.publicSubnet2_az}"
}

output "public_subnet2_cidr" {
  value = "${module.kubeSubnet.publicSubnet2_cidr}"
}




output "private_subnet1_name" {
  value = "${module.kubeSubnet.privateSubnet1_name}"
}

output "private_subnet1_id" {
  value = "${module.kubeSubnet.privateSubnet1_id}"
}

output "private_subnet1_zone" {
  value = "${module.kubeSubnet.privateSubnet1_az}"
}

output "private_subnet1_cidr" {
  value = "${module.kubeSubnet.privateSubnet1_cidr}"
}



output "private_subnet2_name" {
  value = "${module.kubeSubnet.privateSubnet2_name}"
}

output "private_subnet2_id" {
  value = "${module.kubeSubnet.privateSubnet2_id}"
}

output "private_subnet2_zone" {
  value = "${module.kubeSubnet.privateSubnet2_az}"
}

output "private_subnet2_cidr" {
  value = "${module.kubeSubnet.privateSubnet2_cidr}"
}


#output internet gateway info

output "internetgateway_name" {
  value = "${module.kubeInternetGateway.internetgateway_name}"
}

output "internetgateway_id" {
  value = "${module.kubeInternetGateway.internetgateway_id}"
}

#output EIP info

output "eip_name" {
  value = "${module.kubeEip.eip_name}"
}

output "eip_allocationid" {
  value = "${module.kubeEip.eip_allocationid}"
}
