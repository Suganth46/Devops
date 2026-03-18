# module "vpc" {
#   source = "terraform-aws-modules/vpc/aws"

#   name = "test-vpc"
#   cidr = "10.0.0.0/16"

#   azs             = ["us-east-1a", "us-east-1b"]
#     public_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
#   # private_subnets  = ["10.0.2.0/24"]

#   tags = {
#     Name = "test-vpc"
#     team = var.tag_team
#     platform = var.tag_platform
#   }
# }

# output "vpc-id" {
#   value = module.vpc.vpc_id
# }