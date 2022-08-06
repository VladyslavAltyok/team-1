output "region" {
  value = var.region
}

output "tags" {
  value = var.tags
}

output "vpc_id" {
value = aws_vpc.team1-vpc.id
} 

output "public-1_id" {
 value = aws_subnet.public-1.id
} 

output "public-2_id" {
 value = aws_subnet.public-2.id
} 

output "public-3_id" {
 value = aws_subnet.public-3.id
} 

output "private-1_id" {
  value = aws_subnet.private-1.id
}

output "private-2_id" {
  value = aws_subnet.private-2.id
}

output "private-3_id" {
  value = aws_subnet.private-3.id
}

output "internet-gw" {
  value = aws_internet_gateway.internet-gw
}

output "aws_nat_gateway" {
   value = aws_nat_gateway.nat-gw.id
   }

output "elastic_ip" {
    value = aws_eip.eip-for-nat.allocation_id
}
output "aws_route_table_public" {
   value = aws_route_table.public.id 
   }

   output "aws_route_table_private" {
   value = aws_route_table.private.id 
   }
