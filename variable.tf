variable "vpc_cidr" {
  type        = string
  description = "CIDR block for the VPC"
}

variable "vpc_name" {
  type        = string
  description = "Name of the VPC"
}

variable "public_subnet_cidr" {
  type        = string
  description = "CIDR block for the public subnet"
}

variable "public_az" {
  type        = string
  description = "Availability zone for the public subnet"
}

variable "private_subnet_cidr" {
  type        = string
  description = "CIDR block for the private subnet"
}

variable "private_az" {
  type        = string
  description = "Availability zone for the private subnet"
}

variable "igw_name" {
  type        = string
  description = "Name of the Internet Gateway"
}

variable "ec2_ami_id" {
  type        = string
  description = "AMI ID for the EC2 instance"
}

variable "ec2_instance_type" {
  type        = string
  description = "Instance type for the EC2 instance"
}

variable "ec2_key_name" {
  type        = string
  description = "Name of the EC2 key pair"
}