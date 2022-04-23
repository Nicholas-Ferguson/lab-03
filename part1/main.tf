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

resource "aws_instance" "web" {
  ami           = var.ami
  instance_type = var.instance_type
}
