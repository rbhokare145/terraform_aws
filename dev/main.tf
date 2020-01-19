provider "aws" {
  region = "${var.user_region}"
}

module "kubeVpc" {
  source = "github.com/rbhokare145/terraform_aws//modules/vpc?ref=v1.0.0"
  cidr_range = "${var.user_cidr_range}"
}

module "kubeSubnet" {
  source = "../modules/subnet"
  pub1_cidr_range = "${var.user_pub1_cidr_range}"
  pub2_cidr_range = "${var.user_pub2_cidr_range}"
  pri1_cidr_range = "${var.user_pri1_cidr_range}"
  pri2_cidr_range = "${var.user_pri2_cidr_range}"
  vpc_id = "${module.kubeVpc.kubeVpc_id}"

}

module "kubeInternetGateway" {
  source = "github.com/rbhokare145/terraform_aws//modules/internetGateway?ref=v1.0.0"
  vpc_id = "${module.kubeVpc.kubeVpc_id}"
}

module "kubeEip" {
  source = "github.com/rbhokare145/terraform_aws//modules/eip?ref=v1.0.0"
}

module "kubeNatGateway" {
  source = "github.com/rbhokare145/terraform_aws//modules/natgateway?ref=v1.0.0"
  eip_allocationid = "${module.kubeEip.eip_allocationid}"
  public_subnetid = "${module.kubeSubnet.publicSubnet1_id}"
}

module "kubeRouteTable" {
  source = "github.com/rbhokare145/terraform_aws//modules/routetables?ref=v1.0.0"
  vpc_id = "${module.kubeVpc.kubeVpc_id}"
  private_sub1_id = "${module.kubeSubnet.privateSubnet1_id}"
  private_sub2_id = "${module.kubeSubnet.privateSubnet2_id}"
  private_routable_id = "${module.kubeRouteTable.private_routable_id}"

  public_sub1_id = "${module.kubeSubnet.publicSubnet1_id}"
  public_sub2_id = "${module.kubeSubnet.publicSubnet2_id}"
  public_routable_id = "${module.kubeRouteTable.public_routable_id}"

  nat_gw_id = "${module.kubeNatGateway.nat_id}"
  igw_id = "${module.kubeInternetGateway.internetgateway_id}"
}

module "kubeNacl" {
  source = "../modules/nacl"
  vpc_id = "${module.kubeVpc.kubeVpc_id}"
  cidr_range = "${var.user_cidr_range}"
  user_iprange = "${var.user_ip}"
}

module "kubeSecurityGroup" {
  source = "../modules/securityGroup"
  vpc_id = "${module.kubeVpc.kubeVpc_id}"
  cidr_range = "${var.user_cidr_range}"
  user_iprange = "${var.user_ip}"
}


module "kubeNodeKeyPair" {
  source = "../modules/keypair"
  key_name = "${var.user_key_name}"
  public_key = "${var.user_public_key}"
}

module "kubeEc2Instance" {
  source = "../modules/ec2"
  ami_id = "${var.user_ami_id}"
  ec2_type = "${var.user_ec2_type}"
  availibility_zone = "${module.kubeSubnet.privateSubnet2_az}"
  security_groupId = "${module.kubeSecurityGroup.KubeSecurityGroupId}"
  key_name = "${module.kubeNodeKeyPair.key_name}"
  private_subnet_id = "${module.kubeSubnet.privateSubnet2_id}"
  public_subnet_id = "${module.kubeSubnet.publicSubnet2_id}"
}
