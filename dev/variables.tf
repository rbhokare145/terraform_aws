variable "user_cidr_range" {
  description = "user define perticular cidr range specific to each environment"
  type = string
  default = "192.168.10.0/24"
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

