output "vpc_id" {
    value = aws_vpc.team1-vpc.id
  
}

output "public_subnet_count" {
    value = aws_subnet.public
  
}

