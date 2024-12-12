resource "aws_instance" "bastion_Host" {
  ami                    = "ami-0e2c8caa4b6378d8c"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.public_subnet_1.id
  key_name               = aws_key_pair.key_pair.key_name
  vpc_security_group_ids = [aws_security_group.bastion_sg.id]
  tags = {
    Name = "Public_bastion_Host"
  }
}
