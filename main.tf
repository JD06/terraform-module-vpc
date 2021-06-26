resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr
  enable_dns_support = "true"
  enable_dns_hostnames = "true"
  enable_classiclink = "false"
  instance_tenancy = "default"

  tags = {
    Name          = "${var.name}-${var.infra_env}-vpc"
    Environment   = var.infra_env
    ManagedBy     =  "terraform"
  }
}

resource "aws_subnet" "public" {
  for_each = var.public_subnet
  map_public_ip_on_launch = "true"
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value )
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name      = "${var.name}-${var.infra_env}-${each.key}"
    Environment     = var.infra_env
    ManagedBy       = "terraform"
    Subnet          = "${each.key}-${each.value}"
  }
}

resource "aws_subnet" "private" {
  for_each = var.private_subnet
  cidr_block = cidrsubnet(aws_vpc.vpc.cidr_block, 4, each.value )
  vpc_id = aws_vpc.vpc.id

  tags = {
    Name      = "${var.name}-${var.infra_env}-${each.key}"
    Environment     = var.infra_env
    ManagedBy       = "terraform"
    Subnet          = "${each.key}-${each.value}"
  }
}