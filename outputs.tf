output "ec2_public_ips" {
  value = [for instance in aws_instance.my_instance : instance.public_ip]
}

output "ec2_public_dns" {
  value = [for instance in aws_instance.my_instance : instance.public_dns]
}

output "ec2_private_ips" {
  value = [for instance in aws_instance.my_instance : instance.private_ip]
}

output "ec2_instance_ids" {
  value = [for instance in aws_instance.my_instance : instance.id]
}
