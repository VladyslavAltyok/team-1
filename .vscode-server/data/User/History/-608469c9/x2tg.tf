output "vpc_id" {
    value = aws_vpc.team1-vpc.id
  
}

output "public_subnet_count" {
    value = length(aws_subnet.)
  
}

output "private_subnet_count" {
    value = length(module.subnets.subnet_id)
  
}
