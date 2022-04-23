
provider "aws" {
  region = var.region
}

resource "aws_security_group" "ansible" {
  name   = "ansible"
  vpc_id = var.vpc_id

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

resource "aws_instance" "ansible" {
  ami                         = var.ami
  subnet_id                   = var.subnet_id
  instance_type               = var.instance_type
  associate_public_ip_address = true
  security_groups             = [aws_security_group.ansible.id]
  key_name                    = var.key_name

  provisioner "remote-exec" {
    inline = ["echo 'Wait until SSH is ready'"]

    connection {
      type        = "ssh"
      user        = var.ssh_user
      private_key = file(var.private_key_path)
      host        = aws_instance.ansible.public_ip
    }
  }
  provisioner "local-exec" {
    inline = [
      "sudo amazon-linux-extras install ansible2 -y",
      "sudo yum install git -y", 
      "ansible-playbook  -i ${aws_instance.ansible.public_ip}, --private-key ${var.private_key_path} getfacts.yaml"
    ]
  }
}

output "ansible_ip" {
  value = aws_instance.ansible.public_ip
}
