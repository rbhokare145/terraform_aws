variable "vpc_id" {
  description = "VPC ID of the nacl association"
}

variable "cidr_range" {
  description = "vpc cidr range to be defined in rule"
}

variable "user_iprange" {
  description = "user machine ip address range"
}