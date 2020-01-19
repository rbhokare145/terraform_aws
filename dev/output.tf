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

#Output EIP info

output "eip_name" {
  value = "${module.kubeEip.eip_name}"
}

output "eip_allocationid" {
  value = "${module.kubeEip.eip_allocationid}"
}


#Output Private RouteTable info

output "private_routable_name" {
  value = "${module.kubeRouteTable.private_routable_name}"
}

output "private_routable_id" {
  value = "${module.kubeRouteTable.private_routable_id}"
}

# Output Network ack info

output "network_acl_name" {
  value = "${module.kubeNacl.nacl_name}"
}

output "network_acl_id" {
  value = "${module.kubeNacl.nacl_id}"
}


# Output Security Group Info

output "security_group_name" {
  value = "${module.kubeSecurityGroup.KubeSecurityGroupName}"
}

output "security_group_id" {
  value = "${module.kubeSecurityGroup.KubeSecurityGroupId}"
}

output "key_name" {
  value = "${module.kubeNodeKeyPair.key_name}"
}


output "jumbBox_instanceName" {
  value = "${module.kubeEc2Instance.jumbBox_instanceName}"
}

output "jumpBox_instanceId" {
  value = "${module.kubeEc2Instance.jumpBox_instanceId}"
}

output "jumbBox_instancePublicIp" {
  value = "${module.kubeEc2Instance.jumbBox_instancePublicIp}"
}

output "kubeMaster_instanceName" {
  value = "${module.kubeEc2Instance.kubeMaster_instanceName}"
}

output "kubeMaster_instanceId" {
  value = "${module.kubeEc2Instance.kubeMaster_instanceId}"
}

output "kubeMaster_instanceIp" {
  value = "${module.kubeEc2Instance.kubeMaster_instanceIp}"
}

output "kubeNode1_instanceName" {
  value = "${module.kubeEc2Instance.kubeNode1_instanceName}"
}

output "kubeNode1_instanceId" {
  value = "${module.kubeEc2Instance.kubeNode1_instanceId}"
}

output "kubeNode1_instanceIp" {
  value = "${module.kubeEc2Instance.kubeNode1_instanceIp}"
}

output "kubeNode2_instanceId" {
  value = "${module.kubeEc2Instance.kubeNode2_instanceId}"
}

output "kubeNode2_instanceName" {
  value = "${module.kubeEc2Instance.kubeNode2_instanceName}"
}

output "kubeNode2_instanceIp" {
  value = "${module.kubeEc2Instance.kubeNode2_instanceIp}"
}