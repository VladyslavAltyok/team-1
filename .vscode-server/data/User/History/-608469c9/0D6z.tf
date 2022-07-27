output "vpc_id" {
    value = aws_vpc.vpc.id
  
}

output "public_subnet_count" {
    value = length(module.subnets.subnet_id)
  
}

output "private_subnet_count" {
    value = length(module.subnets.subnet_id)
  
}
