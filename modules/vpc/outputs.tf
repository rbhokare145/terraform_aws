variable "cidr_output" {
  value = aws_vpc.kubeVpc.cidr_block
  description = "configured CIDR range"
}