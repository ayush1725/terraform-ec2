#key pair(login to ec2)
resource "aws_key_pair" "key_pair" {
  key_name   = "terra-key-ec2"
  public_key = file("terra-key-ec2.pub")
}
# vpc and security group
resource "aws_default_vpc" "default" {

}
resource "aws_security_group" "my_security_group" {
  name        = "automate-sg"
  description = "This will add a TF generated security group"
  vpc_id      = aws_default_vpc.default.id #interpolation- It is a way of inheriting and extracting values from other resources / tf blocks

  #inbound rules   
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #allowing all IPs to access the instance
    description = "SSH access open"
  }
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #allowing all IPs to access the instance
    description = "HTTP access open"
  }
  ingress {
    from_port   = 8000
    to_port     = 8000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] #allowing all IPs to access the instance
    description = "Flask access open"
  }
  #outbound rules
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1" #-1 means all protocols
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow all outbound traffic"
  }

  tags = {
    Name = "automate-sg"
  }
}
#ec2 instance
resource "aws_instance" "my_instance" {
  key_name        = aws_key_pair.key_pair.key_name
  security_groups = [aws_security_group.my_security_group.name]
  instance_type   = var.ec2_instance_type    # "t2.micro" or any other instance type you want to use
  ami             = var.ec2_ami_id           # Ubuntu Server 24.04 LTS (HVM)
  user_data       = file("install_nginx.sh") # Script to install Nginx and Flask app

  root_block_device {
    volume_size = var.ec2_root_storage_size # Size in GB
    volume_type = "gp3"                     # General Purpose SSD
  }
  tags = {
    Name = "TF-EC2-automate"
  }
}