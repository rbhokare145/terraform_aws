provider "aws" {
  region = "${var.user_region}"
}

# To enable the s3 backend uncomment below lines

//terraform {
//  backend "s3" {
//    bucket         = "kube-terraform-up-and-running-locks"
//    key            = "global/s3/terraform.tfstate"
//    region         = "ap-south-1"
//    dynamodb_table = "terraform-up-and-running-locks"
//    encrypt        = "true"
//  }
//}

//module "kubeS3" {
//  source                 = "github.com/rbhokare145/terraform_aws//modules/s3?ref=v3.0.0"
//  bucket_name            = "${var.bucket_name}"
//  bucket_versioning_mode = "${var.versioning_mode}"
//}
//
//module "kubeDynamoDB" {
//  source        = "github.com/rbhokare145/terraform_aws//modules/dynamodb?ref=v3.0.0"
//  dynamodb_name = "${var.dynamodb_name}"
//}


module "kubeVpc" {
  source     = "github.com/rbhokare145/terraform_aws//modules/vpc?ref=v3.0.0"
  cidr_range = "${var.user_cidr_range}"
}

module "kubeSubnet" {
  source          = "github.com/rbhokare145/terraform_aws//modules/subnet?ref=v3.0.0"
  pub1_cidr_range = "${var.user_pub1_cidr_range}"
  pub2_cidr_range = "${var.user_pub2_cidr_range}"
  pri1_cidr_range = "${var.user_pri1_cidr_range}"
  pri2_cidr_range = "${var.user_pri2_cidr_range}"
  vpc_id          = "${module.kubeVpc.kubeVpc_id}"

}

module "kubeInternetGateway" {
  source = "github.com/rbhokare145/terraform_aws//modules/internetGateway?ref=v3.0.0"
  vpc_id = "${module.kubeVpc.kubeVpc_id}"
}

module "kubeEip" {
  source = "github.com/rbhokare145/terraform_aws//modules/eip?ref=v3.0.0"
}


module "kubeNatGateway" {
  source           = "github.com/rbhokare145/terraform_aws//modules/natgateway?ref=v3.0.0"
  eip_allocationid = "${module.kubeEip.eip_allocationid}"
  public_subnetid  = "${module.kubeSubnet.publicSubnet1_id}"
}

module "kubeRouteTable" {
  source              = "github.com/rbhokare145/terraform_aws//modules/routetables?ref=v3.0.0"
  vpc_id              = "${module.kubeVpc.kubeVpc_id}"
  private_sub1_id     = "${module.kubeSubnet.privateSubnet1_id}"
  private_sub2_id     = "${module.kubeSubnet.privateSubnet2_id}"
  private_routable_id = "${module.kubeRouteTable.private_routable_id}"

  public_sub1_id     = "${module.kubeSubnet.publicSubnet1_id}"
  public_sub2_id     = "${module.kubeSubnet.publicSubnet2_id}"
  public_routable_id = "${module.kubeRouteTable.public_routable_id}"

  nat_gw_id = "${module.kubeNatGateway.nat_id}"
  igw_id    = "${module.kubeInternetGateway.internetgateway_id}"
}

module "kubeNacl" {
  source       = "github.com/rbhokare145/terraform_aws//modules/nacl?ref=v3.0.0"
  vpc_id       = "${module.kubeVpc.kubeVpc_id}"
  cidr_range   = "${var.user_cidr_range}"
  user_iprange = "${var.user_ip}"
}

module "kubeSecurityGroup" {
  source       = "github.com/rbhokare145/terraform_aws//modules/securityGroup?ref=v3.0.0"
  vpc_id       = "${module.kubeVpc.kubeVpc_id}"
  cidr_range   = "${var.user_cidr_range}"
  user_iprange = "${var.user_ip}"
}

module "kubeNodeKeyPair" {
  source     = "github.com/rbhokare145/terraform_aws//modules/keypair?ref=v3.0.0"
  key_name   = "${var.user_key_name}"
  public_key = "${var.user_public_key}"
}

module "kubeEni" {
  source              = "github.com/rbhokare145/terraform_aws//modules/eni?ref=v3.0.0"
  private_subnet_id   = "${module.kubeSubnet.privateSubnet2_id}"
  security_groupId    = "${module.kubeSecurityGroup.KubeSecurityGroupId}"
  kubemaster_instance = "${module.kubeEc2Instance.kubeMaster_instanceId}"
}

module "kubeEc2Instance" {
  source            = "github.com/rbhokare145/terraform_aws//modules/ec2?ref=v3.0.0"
  ami_id            = "${var.user_ami_id}"
  ec2_type          = "${var.user_ec2_type}"
  availibility_zone = "${module.kubeSubnet.privateSubnet2_az}"
  security_groupId  = "${module.kubeSecurityGroup.KubeSecurityGroupId}"
  key_name          = "${module.kubeNodeKeyPair.key_name}"
  private_subnet_id = "${module.kubeSubnet.privateSubnet2_id}"
  public_subnet_id  = "${module.kubeSubnet.publicSubnet2_id}"
}
