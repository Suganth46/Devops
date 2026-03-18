
# #aws - vpc
# resource "aws_vpc" "test-vpc" {
#   cidr_block       = "10.20.0.0/16"
#   instance_tenancy = "default"

#   tags = {
#     name="test-vpc"
#     team=var.tag_platform
#     platform=var.tag_platform
#   }
# }

# #subnet - public
# resource "aws_subnet" "test-subnet-public" {
#   vpc_id     = aws_vpc.test-vpc.id
#   cidr_block = "10.20.1.0/24"
#   availability_zone = "us-east-1a"
#   tags = {
#     Name = "test-subnet-public"
#     team= var.tag_team
#     platform=var.tag_platform
#   }
# }

# #subnet - private
# resource "aws_subnet" "test-subnet-private" {
#   vpc_id     = aws_vpc.test-vpc.id
#   cidr_block = "10.20.2.0/24"
#   availability_zone = "us-east-1b"
#   tags = {
#     Name = "test-subnet-private"
#     team= var.tag_team
#     platform=var.tag_platform
#   }
# }


# #internet gateway
# resource "aws_internet_gateway" "test-igw" {
#   vpc_id = aws_vpc.test-vpc.id

#   tags = {
#     Name = "test-igw"
#     team=var.tag_team
#     platform=var.tag_platform
#   }
# }

# #route table
# resource "aws_route_table" "test-rt" {
#   vpc_id = aws_vpc.test-vpc.id

#   route {
#     cidr_block = "0.0.0.0/0"
#     gateway_id = aws_internet_gateway.test-igw.id
#   }
#   tags = {
#     Name = "test-rt"
#     team=var.tag_team
#     platform=var.tag_platform
#   }
# }


# #route association
# resource "aws_route_table_association" "route_subnet_public" {
#   subnet_id      = aws_subnet.test-subnet-public.id
#   route_table_id = aws_route_table.test-rt.id
# }