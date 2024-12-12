resource "aws_launch_template" "nginx-EC2s" {
  name_prefix            = "nginx-EC2s"
  image_id               = "ami-0e2c8caa4b6378d8c"
  instance_type          = "t2.micro"
  vpc_security_group_ids = [aws_security_group.asg_sg.id]
  key_name               = aws_key_pair.key_pair.key_name
  user_data = filebase64("install_nginx.sh")
}

resource "aws_autoscaling_group" "auto-grp" {
  vpc_zone_identifier = [aws_subnet.private_subnet_1.id, aws_subnet.private_subnet_2.id]
  desired_capacity    = 2
  max_size            = 4
  min_size            = 1

  launch_template {
    id      = aws_launch_template.nginx-EC2s.id
    version = "$Latest"
  }

  lifecycle {
    create_before_destroy = true
  }
}

