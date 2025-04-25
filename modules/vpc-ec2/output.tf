output "vpc_id" {
  value = aws_vpc.task_vpc.id
  description = "ID of the VPC"
}

output "public_subnet_id" {
  value = aws_subnet.public_subnet.id
  description = "ID of the public subnet"
}

output "private_subnet_id" {
  value = aws_subnet.private_subnet.id
  description = "ID of the private subnet"
}

output "instance_public_ip" {
  value = aws_instance.server.public_ip
  description = "Public IP of the EC2 instance"
}

output "instance_private_ip" {
  value = aws_instance.server.private_ip
  description = "Private IP of the EC2 instance"
}

output "security_group_id" {
  value = aws_security_group.ec2_sg.id
  description = "ID of the EC2 security group"
}