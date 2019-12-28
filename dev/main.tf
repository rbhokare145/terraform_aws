provider "aws" {
  region = "ap-south-1"

}

module "kubeVpc" {
  source = "../modules/vpc"
  cidr_range = "${var.user_cidr_range}"
}

