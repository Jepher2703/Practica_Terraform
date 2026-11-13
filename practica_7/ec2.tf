variable "instance_name" {
    description = "Nombre de las instancia EC2"
    type = list(string)
    default = ["apache", "nginx", "mysql"]
}


resource "aws_instance" "public_instance" {
    for_each = toset(var.instance_name)
    ami = var.ec2_spacs.ami
    instance_type = var.ec2_spacs.instance_type
    subnet_id = aws_subnet.public_subnet_virginia.id
    key_name = data.aws_key_pair.key.key_name
    vpc_security_group_ids = [aws_security_group.public_sg_virginia.id]
    user_data = file("scripts/userdata.sh")

    tags = {
        "Name" = "${each.value}-${local.sufix}"
    }
}

resource "aws_instance" "monitoring_instance" {
    count = var.monitoring_instance==1 ? 1 : 0
    ami = var.ec2_spacs.ami
    instance_type = var.ec2_spacs.instance_type
    subnet_id = aws_subnet.public_subnet_virginia.id
    key_name = data.aws_key_pair.key.key_name
    vpc_security_group_ids = [aws_security_group.public_sg_virginia.id]
    user_data = file("scripts/userdata.sh")

    tags = {
        "Name" = "monitoring-${local.sufix}"
    }
}