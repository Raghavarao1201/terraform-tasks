variable "cidr_block" {
    description = "CIDR block of vpc"
    type        = string
}

variable "vpc_name" {
    description = "The name of the vpc"
    type        = string
}

variable "public_subnet_cidr_block" {
  description = "The CIDR block for the public subnet"
  type        = string
}

variable "private_subnet_cidr_block" {
  description = "The CIDR block for the private subnet"
  type        = string
}

variable "public_availability_zone" {
  description = "The availability zone for the public subnet"
  type        = string
}

variable "private_availability_zone" {
  description = "The availability zone for the private subnet"
  type        = string
}

variable "igw_name" {
  description = "The name of the internet gateway"
  type        = string
}

variable "ami_id" {
  description = "The ami id of Instance"
  type        = string
}

variable "instance_type" {
  description = "The type of Instance"
  type        = string
}

variable "key_name" {
  description = "The key pair"
  type        = string
}
