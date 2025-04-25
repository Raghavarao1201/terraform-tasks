output "vpc_id" {
  value       = module.vpc-ec2.vpc_id
  description = "ID of the created VPC"
}

output "public_subnet_id" {
  value       = module.vpc-ec2.public_subnet_id
  description = "ID of the created public subnet"
}

output "private_subnet_id" {
  value       = module.vpc-ec2.private_subnet_id
  description = "ID of the created private subnet"
}

output "instance_public_ip" {
  value       = module.vpc-ec2.instance_public_ip
  description = "Public IP of the EC2 instance"
}

output "instance_private_ip" {
  value       = module.vpc-ec2.instance_private_ip
  description = "Private IP of the EC2 instance"
}

output "security_group_id" {
  value       = module.vpc-ec2.security_group_id
  description = "ID of the EC2 security group"
}