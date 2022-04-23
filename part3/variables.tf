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

variable "key_name" {
  description = "AWS SSH Key"
  default     = "aws-key"
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
