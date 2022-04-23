variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ami" {
  description = "AMI of image"
  default     = "ami-03ededff12e34e59e"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}

variable "vpc_id" {
  description = "VPC ID"
  default = "vpc-037a7f6c0d5ee6b21"
}

variable "subnet_id" {
  description = "Subnet ID"
  default = "subnet-0f918f3964cd5929d"
}

variable "ssh_user" {
  description = "SSH User"
  default = "admin"
}

variable "key_name" {
  description = "AWS SSH Key"
  default = "aws-key"
}

variable "private_key_path" {
  description = "SSH Key Path"
  default = "~/Downloads/aws-key.pem"
}

variable "project_tags" {
  type = map
  default = {
    Name       = "terraform-lab"
    Owner      = "Nicholas Ferguson"
    Purpose    = "Lab"
    CostCenter = "0001"
  }
}
