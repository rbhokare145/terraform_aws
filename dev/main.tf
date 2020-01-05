provider "aws" {
  region = "${var.user_region}"

}

module "kubeVpc" {
  source = "../modules/vpc"
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
  source = "../modules/internetGateway"
  vpc_id = "${module.kubeVpc.kubeVpc_id}"
}

module "kubeEip" {
  source = "../modules/eip"
}

module "kubeNatGateway" {
  source = "../modules/natgateway"
  eip_allocationid = "${module.kubeEip.eip_allocationid}"
  public_subnetid = "${module.kubeSubnet.publicSubnet1_id}"
}

module "kubeRouteTable" {
  source = "../modules/routetables"
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
