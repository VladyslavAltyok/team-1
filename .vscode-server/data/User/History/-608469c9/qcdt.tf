output "vpc_id" {
    value = aws_vpc.team1-vpc.id
  
}

output "internet_gateway_id" {
    value = aws_internet_gateway.internet-gw.id
  
}

output "nat_gateway_id" {
    value = aws_nat_gateway.nat-gw.id
  
}

output "elastic_ip" {
    value = aws_eip.eip-for-nat.address
  
}

