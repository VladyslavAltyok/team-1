output "vpc_id" {
    value = aws_vpc.team1-vpc.id
  
}

output "internet_gateway_id" {
    value = aws_internet_gateway.internet-gw.id
  
}

