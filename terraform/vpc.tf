resource "aws_vpc" "deepak" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "deepak-vpc"
  }
}

resource "aws_subnet" "deepak-subnet" {
  vpc_id            = aws_vpc.deepak.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1b"
  tags = {
    Name = "deepak-subnet"
  }
}

resource "aws_internet_gateway" "deepak-gw" {
  vpc_id = aws_vpc.deepak.id

  tags = {
    Name = "deepak-gw"
  }
}

resource "aws_route_table" "deepak-route-table" {
  vpc_id = aws_vpc.deepak.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.deepak-gw.id
  }

  tags = {
    Name = "deepak-route-table"
  }
}

resource "aws_route_table_association" "deepak-route-table-association" {
  subnet_id      = aws_subnet.deepak-subnet.id
  route_table_id = aws_route_table.deepak-route-table.id
}