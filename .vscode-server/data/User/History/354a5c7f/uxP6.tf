# Create VPC in us-east
resource "aws_vpc" "team1-vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
        Name = "team1-vpc"
    }
}

#Create 3 public subnets
resource "aws_subnet" "public-1" {
    vpc_id = aws_vpc.team1-vpc.id
    cidr_block = "10.0.101.0/24" 
    availability_zone = "us-east-1a"

    tags = {
        Name = "public-1"
    }
}

resource "aws_subnet" "public-2" {
    vpc_id = aws_vpc.team1-vpc.id
    cidr_block = "10.0.102.0/24"
    availability_zone = "us-east-1b"

    tags = {
        Name = "public-2"
    }
}

resource "aws_subnet" "public-3" {
    vpc_id = aws_vpc.team1-vpc.id
    cidr_block = "10.0.103.0/24"
    availability_zone = "us-east-1c"

     tags = {
        Name = "public-3"
    }
}


#Create 3 Private subnets

resource "aws_subnet" "private-1" {
    vpc_id = aws_vpc.team1-vpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1a"

     tags = {
        Name = "private-1"
    }
}

resource "aws_subnet" "private-2" {
    vpc_id = aws_vpc.team1-vpc.id
    cidr_block = "10.0.2.0/24"
    availability_zone = "us-east-1b"

     tags = {
        Name = "private-2"
    }
}

resource "aws_subnet" "private-3" {
    vpc_id = aws_vpc.team1-vpc.id
    cidr_block = "10.0.3.0/24"
    availability_zone = "us-east-1c"

    tags = {
        Name = "private-3"
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

# Create NAT Gateway (needs work)

#resource "aws_nat_gateway" "nat-gw" {
 #   subnet_id = aws_subnet.public-1.id
  #  connectivity_type = "public"
  
#}

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