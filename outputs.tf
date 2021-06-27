output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "vpc_cidr" {
  value = aws_vpc.vpc.cidr_block
}

output "public_subnets" {
  value = {
    for Subnet in aws_subnet.public :
    Subnet.id => Subnet.cidr_block
  }
}

output "private_subnets" {
  value = {
    for Subnet in aws_subnet.private :
    Subnet.id => Subnet.cidr_block
  }
}