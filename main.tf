# Project7-VPC

resource "aws_vpc" "VPC-PROJECT-7" {
  cidr_block       = var.vpc_cidr
  instance_tenancy = "default"


  tags = {
    Name = "VPC-PROJECT-7"
  }
}

# Public-subnets

resource "aws_subnet" "Prod-pub-sub-1" {
  vpc_id            = aws_vpc.VPC-PROJECT-7.id
  cidr_block        = var.Public_subnet_1_cidr
  availability_zone = var.Availibilty_zone_1
  tags = {
    Name = "Prod-pub-sub-1"
  }
}

resource "aws_subnet" "Prod-pub-sub-2" {
  vpc_id            = aws_vpc.VPC-PROJECT-7.id
  cidr_block        = "10.0.2.0/24"
  availability_zone = var.Availibilty_zone_2
  tags = {
    Name = "Prod-pub-sub-2"
  }
}

# Private -subnets
resource "aws_subnet" "Prod-priv-sub-1" {
  vpc_id            = aws_vpc.VPC-PROJECT-7.id
  cidr_block        = var.Private_subnet_1_cidr
  availability_zone = var.Availibilty_zone_3
  tags = {
    Name = "Prod-priv-sub-1"
  }
}

resource "aws_subnet" "Prod-priv-sub-2" {
  vpc_id            = aws_vpc.VPC-PROJECT-7.id
  cidr_block        = "10.0.4.0/24"
  availability_zone = var.Availibilty_zone_4
  tags = {
    Name = "Prod-priv-sub-2"
  }
}

# Prod-public-route-table
resource "aws_route_table" "Prod-pub-route-table" {
  vpc_id = aws_vpc.VPC-PROJECT-7.id

  tags = {
    Name = "Prod-pub-route-table"
  }
}

# Prod-priv-route-table
resource "aws_route_table" "Prod-priv-route-table" {
  vpc_id = aws_vpc.VPC-PROJECT-7.id

  tags = {
    Name = "Prod-priv-route-table"
  }
}

# public-route-table-association

resource "aws_route_table_association" "public-route-table-association-1" {
  subnet_id      = aws_subnet.Prod-pub-sub-1.id
  route_table_id = aws_route_table.Prod-pub-route-table.id
}

resource "aws_route_table_association" "public-route-table-association-2" {
  subnet_id      = aws_subnet.Prod-pub-sub-2.id
  route_table_id = aws_route_table.Prod-pub-route-table.id
}

# private-route-table-association

resource "aws_route_table_association" "private-route-table-association-1" {
  subnet_id      = aws_subnet.Prod-priv-sub-1.id
  route_table_id = aws_route_table.Prod-priv-route-table.id
}

resource "aws_route_table_association" "private-route-table-association-2" {
  subnet_id      = aws_subnet.Prod-priv-sub-2.id
  route_table_id = aws_route_table.Prod-priv-route-table.id

}

#internet-gateway
resource "aws_internet_gateway" "Prod-igw" {
  vpc_id = aws_vpc.VPC-PROJECT-7.id

  tags = {
    Name = "Prod-igw"
  }
}

# internet-gateway route
resource "aws_route" "Prod-igw-association" {
  route_table_id         = aws_route_table.Prod-pub-route-table.id
  gateway_id             = aws_internet_gateway.Prod-igw.id
  destination_cidr_block = "0.0.0.0/0"
}

#Elastic ip allocation
resource "aws_eip" "nat-eip" {
}


resource "aws_nat_gateway" "Prod-Nat-gateway" {
  allocation_id = aws_eip.nat-eip.id
  subnet_id     = aws_subnet.Prod-pub-sub-1.id

  tags = {
    Name = "Prod-Nat-gateway"
  }
}

resource "aws_route" "Prod-Nat-association" {
  route_table_id         = aws_route_table.Prod-priv-route-table.id
  gateway_id             = aws_nat_gateway.Prod-Nat-gateway.id
  destination_cidr_block = "0.0.0.0/0"
}




resource "aws_instance" "T_ec2" {
  ami           = "ami-028eb925545f314d6"
  instance_type = "t2.micro"

  tags = {
    Name = "T-ec2"
  }
}