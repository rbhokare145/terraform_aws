variable "ami_id" {
  description = "ami_id to be used while spining up an EC2 instance"
  default = "ami-0a74bfeb190bd404f"
}

variable "ec2_type" {
  description = "Instance type to be specified by user"
  default = "t2.micro"
}

variable "availibility_zone" {
  description = "availibility zone to used by ec2 instance"
}

variable "security_groupId" {
  description = "list of security_group id associated with ec2 instance"
}

variable "public_subnet_id" {
  description = "subnet id in which ec2 instance spin up"
}

variable "private_subnet_id" {
  description = "subnet id in which ec2 instance spin up"
}

variable "key_name" {
  description = "key pair name use by ec2 instance"
}

