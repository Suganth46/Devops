# # Ec2 web
# resource "aws_instance" "test-web" {
#   ami = var.my-ami
#   instance_type = var.my-instance
#   key_name = "Test-server"
#   associate_public_ip_address = "true"  
#   subnet_id = aws_subnet.test-subnet-public.id
#   vpc_security_group_ids = [ aws_security_group.test-sg.id ]
#   tags = {
#     name="test-web"
#     team=var.tag_team
#     platform=var.tag_platform
#   }
# }

# # security group
# resource "aws_security_group" "test-sg" {
#   name        = "test-sg"
#   description = "Allow TLS inbound traffic and all outbound traffic"
#   vpc_id      = aws_vpc.test-vpc.id

#   tags = {
#     Name = "test-sg"
#     team=var.tag_team
#     platform=var.tag_platform
#   }
# }

# resource "aws_vpc_security_group_ingress_rule" "allow_ssh" {
#   security_group_id = aws_security_group.test-sg.id
#   cidr_ipv4         = "0.0.0.0/0"
#   from_port         = 22
#   ip_protocol       = "tcp"
#   to_port           = 22
# }

# resource "aws_vpc_security_group_ingress_rule" "allow_http" {
#   security_group_id = aws_security_group.test-sg.id
#   cidr_ipv4         = "0.0.0.0/0"
#   from_port         = 80
#   ip_protocol       = "tcp"
#   to_port           = 80
# }


# resource "aws_vpc_security_group_egress_rule" "allow_all_traffic_ipv4" {
#   security_group_id = aws_security_group.test-sg.id
#   cidr_ipv4         = "0.0.0.0/0"
#   ip_protocol       = "-1" # semantically equivalent to all ports
# }

# # Ec2 Db
# resource "aws_instance" "test-db" {
#   ami = var.my-ami
#   instance_type = var.my-instance
#   key_name = "Test-server"
#   subnet_id = aws_subnet.test-subnet-private.id
#   vpc_security_group_ids = [ aws_security_group.test-sg.id ]
#   tags = {
#     name="test-db"
#     team=var.tag_team
#     platform=var.tag_platform
#   }
# }