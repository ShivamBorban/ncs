variable "region" {
  type    = string
  default = "us-east-1"
}

variable "ami" {
  type    = string
  default = "ami-0e2c8caa4b6378d8c"
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
}

variable "key_name" {
  type    = string
  default = "NV-1"
}


variable "user_data" {
  type    = string
  default = <<-EOF
      #!/bin/sh
      sudo apt-get update
      EOF
}
