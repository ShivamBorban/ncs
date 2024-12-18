provider "aws" {
  region = "var.region"
}

resource "aws_instance" "Ubuntu" {
  ami           = "var.ami"
  instance_type = "var.instance_type"
  key_name      = "var.key_name"
}
