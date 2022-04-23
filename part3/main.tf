terraform {
  cloud {
    organization = "sheridan-SDN"

    workspaces {
      name = "terraform-github"
    }
  }
}

provider "aws" {
  region = var.region
}

resource "aws_security_group" "webserver" {
  name        = "webserver"
  description = "allow ssh and http"

  ingress {
    from_port   = 22 
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



resource "aws_instance" "web" {
  ami               = var.ami
  instance_type     = var.instance_type
  availability_zone = var.region
  security_groups   = ["${aws_security_group.webserver.name}"]
  key_name          = var.key_name
  user_data         = <<-EOF
    #! /bin/bash
    sudo yum install httpd -y
    sudo systemctl start httpd
    sudo systemctl enable httpd
    echo "Install webserver using Terraform" >> /var/www/html/index.html
  EOF
}
