resource "aws_eip" kubeeip {
  vpc = true
  tags = {
    Name = "Kube_EIP"
  }
}
