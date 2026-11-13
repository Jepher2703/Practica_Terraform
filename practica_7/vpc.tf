resource "aws_vpc" "vpc_virginia" {
    cidr_block = var.virginia_cidr
    tags = {
        Name = "VPC-${local.sufix}"
    }
}

resource "aws_subnet" "public_subnet_virginia" {
    vpc_id = aws_vpc.vpc_virginia.id
    cidr_block = var.subnets[0]
    map_public_ip_on_launch = true
    tags = {
        Name = "Public_Subnet-${local.sufix}"
    }
}

resource "aws_subnet" "private_subnet_virginia" {
    vpc_id = aws_vpc.vpc_virginia.id
    cidr_block = var.subnets[1]
    tags = {
        Name = "Private_Subnet-${local.sufix}"
    }
    depends_on = [
        aws_subnet.public_subnet_virginia
        ]
}

resource "aws_internet_gateway" "igw_virginia" {
    vpc_id = aws_vpc.vpc_virginia.id
    tags = {
        Name = "IGW-${local.sufix}"
    }
}

resource "aws_route_table" "public_rt_virginia" {
    vpc_id = aws_vpc.vpc_virginia.id

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.igw_virginia.id
    }

    tags = {
        Name = "Public_RT-${local.sufix}"
    }
}

resource "aws_route_table_association" "public_rt_assoc_virginia" {
    subnet_id = aws_subnet.public_subnet_virginia.id
    route_table_id = aws_route_table.public_rt_virginia.id
}

resource "aws_security_group" "public_sg_virginia" {
    name        = "Public_SG_Instance_Virginia"
    description = "SSH inbound traffic"
    vpc_id      = aws_vpc.vpc_virginia.id
    
    dynamic "ingress" {
        for_each = var.ingress_ports_list
        content {
            from_port   = ingress.value
            to_port     = ingress.value
            protocol    = "tcp"
            cidr_blocks = [var.sg_ingress_cidr]
        }
    }
    
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
       }
    tags = {
        Name = "Public_SG_Instance-${local.sufix}"
    }
}