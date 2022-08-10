# Create VPC
resource "aws_vpc" "team1-vpc" {
    cidr_block = var.cidr_block

  tags = {
        Name = "team1-vpc"
    }
}

#Create 3 public subnets
resource "aws_subnet" "public-1" {
    vpc_id = aws_vpc.team1-vpc.id
    cidr_block = var.public-1
    availability_zone = var.availability_zone
    map_public_ip_on_launch = true

    tags = {
        Name = "public-1"
    }
}

resource "aws_subnet" "public-2" {
    vpc_id = aws_vpc.team1-vpc.id
    cidr_block = var.public-2
    availability_zone = var.availability_zone
    map_public_ip_on_launch = true

    tags = {
        Name = "public-2"
    }
}

resource "aws_subnet" "public-3" {
    vpc_id = aws_vpc.team1-vpc.id
    cidr_block = var.public-3
    availability_zone = var.availability_zone
    map_public_ip_on_launch = true

     tags = {
        Name = "public-3"
    }
}


#Create 3 Private subnets

resource "aws_subnet" "private-1" {
    vpc_id = aws_vpc.team1-vpc.id
    cidr_block = var.private-1
    availability_zone = var.availability_zone
    map_public_ip_on_launch = false

     tags = {
        Name = "private-1"
    }
}

resource "aws_subnet" "private-2" {
    vpc_id = aws_vpc.team1-vpc.id
    cidr_block = var.private-2
    availability_zone = var.availability_zone
    map_public_ip_on_launch = false

     tags = {
        Name = "private-2"
    }
}

resource "aws_subnet" "private-3" {
    vpc_id = aws_vpc.team1-vpc.id
    cidr_block = var.private-3
    availability_zone = var.availability_zone
    map_public_ip_on_launch = false

    tags = {
        Name = "private-3"
    }
}

#Create DB subnets
resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = [aws_subnet.private-1.id, aws_subnet.private-2.id, aws_subnet.private-3.id, aws_subnet.public-1.id]

  tags = {
    Name = "My DB subnet group"
  }
}

# Create IGW

resource "aws_internet_gateway" "internet-gw" {
    vpc_id = aws_vpc.team1-vpc.id

    tags =  {
        Name = "internet-gw"
    }
  
}

# Allocate Elastic IP Address

resource "aws_eip" "eip-for-nat" {
    vpc = true

    tags = {
        Name = "Elastic IP"
    }
  
}

# Create NAT Gateway (needs work)

resource "aws_nat_gateway" "nat-gw" {
    allocation_id = aws_eip.eip-for-nat.id
    subnet_id = aws_subnet.public-1.id
    connectivity_type = "public"
  
}

# Create Route Tables
resource "aws_route_table" "public" {
    vpc_id = aws_vpc.team1-vpc.id

          tags = {
        Name = "public"
    }

    route { 
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.internet-gw.id
        
    }
}

resource "aws_route_table" "private" {
    vpc_id = aws_vpc.team1-vpc.id

    tags = {
        Name = "private"
    }

    route {
        cidr_block = "0.0.0.0/0"
        nat_gateway_id = aws_nat_gateway.nat-gw.id
    }

}

# Set public subnet asociation

resource "aws_route_table_association" "public-rt1" {
    subnet_id = aws_subnet.public-1.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-rt2" {
    subnet_id = aws_subnet.public-2.id
    route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "public-rt3" {
    subnet_id = aws_subnet.public-3.id
    route_table_id = aws_route_table.public.id
}


# Set private subnet asociation

resource "aws_route_table_association" "private-rt1" {
    subnet_id = aws_subnet.private-1.id
    route_table_id = aws_route_table.private.id
  
}

resource "aws_route_table_association" "private-rt2" {
    subnet_id = aws_subnet.private-2.id
    route_table_id = aws_route_table.private.id
  
}

resource "aws_route_table_association" "private-rt3" {
    subnet_id = aws_subnet.private-3.id
    route_table_id = aws_route_table.private.id
}