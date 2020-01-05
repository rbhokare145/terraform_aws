resource "aws_internet_gateway" "kubeInternetGateway" {
  vpc_id = "${var.vpc_id}"
  tags = {
    Name = "Kube_InternetGateway"
  }
}
