variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ami" {
  description = "AMI of image"
  default     = "ami-03ededff12e34e59e" # us-east-1"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
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
