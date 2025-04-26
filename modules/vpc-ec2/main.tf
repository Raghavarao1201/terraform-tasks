resource "aws_vpc" "task_vpc" {
    cidr_block = var.cidr_block
    tags = {
        Name = var.vpc_name
    }
}

resource "aws_subnet" "public_subnet" {
    vpc_id       = aws_vpc.task_vpc.id
    cidr_block   = var.public_subnet_cidr_block
    map_public_ip_on_launch = true
    availability_zone  = var.public_availability_zone
}

resource "aws_subnet" "private_subnet" {
    vpc_id       = aws_vpc.task_vpc.id
    cidr_block   = var.private_subnet_cidr_block
    availability_zone  = var.private_availability_zone
}

resource "aws_internet_gateway" "task_igw" {
    vpc_id  = aws_vpc.task_vpc.id
    tags = {
        Name = var.igw_name
    }
}

resource "aws_route_table" "public_route_table" {
    vpc_id  = aws_vpc.task_vpc.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.task_igw.id
    }
}

resource "aws_route_table_association" "public_rt_association" {
    subnet_id  = aws_subnet.public_subnet.id
    route_table_id = aws_route_table.public_route_table.id
}

resource "aws_eip" "nat_eip" {}


resource "aws_nat_gateway" "nat_gw" {
  allocation_id = aws_eip.nat_eip.id
  subnet_id     = aws_subnet.public_subnet.id
}

resource "aws_route_table" "private_route_table" {
    vpc_id = aws_vpc.task_vpc.id
    
    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat_gw.id
    }
}

resource "aws_route_table_association" "private_rt_association" {
    subnet_id  = aws_subnet.private_subnet.id
    route_table_id = aws_route_table.private_route_table.id
}

# EC2 Instance

resource "aws_instance" "server" {
    ami           = var.ami_id
    instance_type = var.instance_type
    key_name      = var.key_name
    subnet_id     = aws_subnet.public_subnet.id
    vpc_security_group_ids = [aws_security_group.ec2_sg.id]

    provisioner "remote-exec" {
    inline = [
      "sudo apt update -y",
      "sudo apt install -y nginx",
      "sudo systemctl start nginx",
      "sudo systemctl enable nginx",
      "echo '<h1>Hello from Terraform!</h1>' | sudo tee /var/www/html/index.nginx-debian.html",
    ]
  }

  connection {
    type        = "ssh"
    user        = var.ssh_username
    private_key = file(var.private_key_path)
    host        = self.public_ip
  }
}
    


resource "aws_security_group" "ec2_sg" {
    vpc_id  = aws_vpc.task_vpc.id

    ingress {
        from_port  = 22
        to_port    = 22
        protocol   = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port  = 80
        to_port    = 80
        protocol   = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port    = 0
        to_port      = 0
        protocol     = "-1"
        cidr_blocks  = ["0.0.0.0/0"]
    }
}