variable "user_cidr_range" {
  description = "user define perticular cidr range specific to each environment"
  type = string
  default = "192.168.10.0/24"

}