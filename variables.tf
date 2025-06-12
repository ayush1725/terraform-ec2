variable "ec2_instance_type" {
  default = "t2.micro"
  type    = string
}

variable "ec2_default_root_storage_size" {
  default = 10 # Size in GB
  type    = number
}

variable "ec2_ami_id" {
  default = "ami-02521d90e7410d9f0"
  type    = string
}

variable "env" {
  default = "dev"
  type    = string
}