resource "aws_vpc" "my_vpc" {
  cidr_block       = "172.16.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my_vpc"
  }
}