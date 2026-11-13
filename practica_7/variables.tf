variable "virginia_cidr" {
    description = "CIDR Virginia"
    type = string
}

/* variable "public_subnet_virginia_cidr" {
    description = "CIDR puplic subnet"
    type = string
    sensitive = true
}

variable "private_subnet_virginia_cidr" {
    description = "CIDR private subnet"
    type = string
    sensitive = true
} */

variable "subnets" {
    description = "lista de subnets"
    type = list(string)
}

variable "tags" {
    description = "Tags del proyecto"
    type = map(string)
}

variable "sg_ingress_cidr" {
    description = "CIDR para el ingreso de tráfico SSH"
    type = string
}

variable "ec2_spacs" {
    description = "Especificaciones de la instancia EC2"
    type = map(string)
}

variable "monitoring_instance" {
    description = "Indicador de si se debe crear la instancia de monitoreo"
    type = number
}

variable "ingress_ports_list" {
    description = "Lista de puertos de ingreso para el grupo de seguridad"
    type = list(number)
}