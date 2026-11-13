virginia_cidr = "10.10.0.0/16"
/* public_subnet_virginia_cidr = "10.10.0.0/24"
private_subnet_virginia_cidr = "10.10.1.0/24" */

subnets = ["10.10.0.0/24", "10.10.1.0/24"]

tags = {
    "env"="dev"
    "owner"="Jefferson"
    "Cloud"="AWS"
    "IAC"="Terraform"
    "IAC_Version"="1.17.1"
    "Project"="practica-terraform"
    "region"="Virginia"
}

sg_ingress_cidr = "0.0.0.0/0"

ec2_spacs = {
    "ami" = "ami-0c230065b91270bc6"
    "instance_type" = "t3.micro"
}

monitoring_instance = 0

ingress_ports_list = [22, 80, 443]