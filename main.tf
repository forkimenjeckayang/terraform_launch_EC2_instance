provider "aws" {
  region = "us-east-1"
}

resource "aws_security_group" "translator_sg" {
  name        = "translate_sg"
  description = "Allow HTTP, SSH, and port 5000"

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

  ingress {
    from_port   = 5000
    to_port     = 5000
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

resource "aws_instance" "docker_instance" {
  ami           = "ami-04b70fa74e45c3917"  
  instance_type = "t2.micro"
  key_name      = "test-key"  
  security_groups = [aws_security_group.translator_sg.name]

  connection {
    type        = "ssh"
    user        = "ubuntu"
    private_key = file("~/Downloads/test-key.pem")
    host        = self.public_ip
  }

 provisioner "remote-exec" {
    inline = [
        "sudo apt update",
        "sudo apt install -y docker.io",
        "sudo systemctl enable docker",
        "sudo systemctl start docker,",
        "sudo usermod -aG docker $USER",
        "sudo docker run -d -ti --rm -p 5000:5000 libretranslate/libretranslate"
    ]
  }

  # Define EBS volume configuration
  root_block_device {
    volume_size = 30
  }

  tags = {
    Name = "Translator_Instance"
  }
}

output "instance_id" {
  value = aws_instance.docker_instance.id
}

output "public_ip" {
  value = aws_instance.docker_instance.public_ip
}
