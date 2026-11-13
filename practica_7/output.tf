output "ec2_public_ip" {
  description = "Ip pública de la instancia EC2"
  value       = { for k, v in aws_instance.public_instance : k => v.public_ip }
}