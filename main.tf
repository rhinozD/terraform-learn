provider "aws" {
    region = "ap-northeast-1"
}

variable "cidr_blocks" {
  type = list(string)
  description = "cidr blocks for vpc and subnets"
}

variable "az_zone" {}

resource "aws_vpc" "development-vpc" {
    cidr_block = var.cidr_blocks[0]
    tags = {
        Name = "development"
        Env = "dev"
    }
}

resource "aws_subnet" "dev-subnet-1" {
    vpc_id = aws_vpc.development-vpc.id
    cidr_block = var.cidr_blocks[1]
    availability_zone = var.az_zone
}

output "dev-vpc-id" {
  value       = aws_vpc.development-vpc.id
}

output "dev-subnet-id" {
  value       = aws_subnet.dev-subnet-1.id
}
