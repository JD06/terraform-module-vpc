variable "infra_env" {
  type = string
  description = "Infra Environment Details"
}

variable "name" {
  type = string
  description = "Name of the environment"
}

variable "vpc_cidr" {
  type = string
  description = "The IP range to use for VPC"
}

variable "public_subnet" {
  type = map(string)
  description = "Map of AZ to a string that should be used for public subnet"
  default = {
    "public-subnet-2a" = "2a"
    "public-subnet-2b" = "2b"
    "public-subnet-2c" = "2c"
  }
}

variable "private_subnet" {
  type = map(string)
  description = "Map of AZ to a string that should be used for private subnet"
  default = {
    "private-subnet-2a" = "2a"
    "private-subnet-2b" = "2b"
    "private-subnet-2c" = "2c"
  }
}