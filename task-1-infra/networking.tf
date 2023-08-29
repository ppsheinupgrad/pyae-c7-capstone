resource "aws_vpc" "main" {
  cidr_block           = var.vpc.cidr_block
  instance_tenancy     = "default"
  enable_dns_hostnames = var.vpc.enable_dns_hostnames
  tags                 = merge(local.tags, { Name = "${var.environment}-${var.project}-${var.vpc.name}" })
}

resource "aws_internet_gateway" "gw" {
  vpc_id = aws_vpc.main.id
  tags   = local.tags
}

resource "aws_subnet" "public_subnet" {
  count                   = var.vpc.number_of_public_subnets
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.20.${10 + count.index}.0/24"
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = true
  tags                    = merge(local.tags, { Name = "${var.environment}-public-subnet-${data.aws_availability_zones.available.names[count.index]}" })
}

resource "aws_subnet" "private_subnet" {
  count                   = var.vpc.number_of_private_subnets
  vpc_id                  = aws_vpc.main.id
  cidr_block              = "10.20.${20 + count.index}.0/24"
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  map_public_ip_on_launch = false
  tags                    = merge(local.tags, { Name = "${var.environment}-private-subnet-${data.aws_availability_zones.available.names[count.index]}" })
}

resource "aws_eip" "eip" {
  depends_on = [aws_internet_gateway.gw]
  tags       = merge(local.tags, { Name = "eip" })
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.eip.id
  subnet_id     = aws_subnet.public_subnet[0].id
  tags          = merge(local.tags, { Name = "${var.environment}-${var.project}-nat-gw" })
  depends_on    = [aws_internet_gateway.gw, aws_eip.eip]
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw.id
  }
  tags = merge(local.tags, { Name = "${var.environment}-${var.project}-public-rt" })
}

resource "aws_route_table_association" "public" {
  count          = var.vpc.number_of_public_subnets
  subnet_id      = aws_subnet.public_subnet[count.index].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.main.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat.id
  }
  tags = merge(local.tags, { Name = "${var.environment}-${var.project}-private-rt" })
}

resource "aws_route_table_association" "private" {
  count          = var.vpc.number_of_private_subnets
  subnet_id      = aws_subnet.private_subnet[count.index].id
  route_table_id = aws_route_table.private.id
}
