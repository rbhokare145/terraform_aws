variable "vpc_id" {
  description = "User defined vpc id"
  type = string
}

variable "pub1_cidr_range" {
  description = "User defined public subnet1 cidr range"
  type = string
}

variable "pub2_cidr_range" {
  description = "user defined public subnet2 cidr range"
  type = string
}

variable "pri1_cidr_range" {
  description = "user defined private subnet1 cidr range"
  type = string
}

variable "pri2_cidr_range" {
  description = "user defined private subnet2 cidr range"
  type = string
}