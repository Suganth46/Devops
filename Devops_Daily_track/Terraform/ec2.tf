resource "aws_instance" "demo-ec2" {
  ami = var.my-ami
  instance_type = var.my-instance
  key_name = "Test-server"
  vpc_security_group_ids = [ "sg-0aaf683b42c38661e" ]
  associate_public_ip_address = "true"  
  tags = {
    name="demo-ec2"
  }
}