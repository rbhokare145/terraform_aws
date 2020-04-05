variable "user_region" {
  description = "User defined AWS region"
  type = string
  default = "ap-south-1" #Mumbai
}

variable "user_cidr_range" {
  description = "user define perticular cidr range specific to each environment"
  type = string
  default = "192.168.10.0/24"
}

variable "user_ip" {
  description = "user machine ip-address range to allow user to access ec2 instances externelly"
  type = string
}

variable "user_pub1_cidr_range" {
  description = "public1 cidr range for the subnet"
  type = string
  default = "192.168.10.0/28"
}

variable "user_pub2_cidr_range" {
  description = "public1 cidr range for the subnet"
  type = string
  default = "192.168.10.16/28"
}

variable "user_pri1_cidr_range" {
  description = "private1 cidr range for the subnet"
  type = string
  default = "192.168.10.32/28"
}

variable "user_pri2_cidr_range" {
  description = "private2 cidr range for the subnet"
  type = string
  default = "192.168.10.48/28"
}


variable "user_key_name" {
  description = "name of key pair used by ec2 instance"
  default = "kubenodekey"
}

variable "user_public_key" {
  description = "public key value"
  default = "a3ViZW5vZGVrZXkK"
}

variable "user_ami_id" {
  description = "ami id to be use by ec2 instance"
  default = "ami-0a74bfeb190bd404f"
}

variable "user_ec2_type" {
  description = "type of the ec2 instance"
  default = "t2.micro"
}

variable "bucket_name" {
  default = "kube-terraform-up-and-running-locks"
}

variable "versioning_mode" {
  default = true
}

variable "dynamodb_name" {
  default = "terraform-up-and-running-locks"
}