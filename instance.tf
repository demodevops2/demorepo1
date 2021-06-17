provider "aws" {
  
  region     = "${var.region}"
#  access_key = "${var.access_key}"
#  secret_key = "${var.secret_key}"
}





resource "aws_instance" "web" {
  ami           = "${lookup(var.ec2_ami,var.region)}"
  instance_type = "t2.micro"
  security_groups = ["${aws_security_group.allow_ssh.name}"]

  tags={
    Name = "webserver"
  }
}

resource "aws_security_group" "allow_ssh" {
  name        = "allow_ssh"
  description = "Allow ssh traffic"


  ingress {

    from_port   = 22 #  By default, the linux server listens on TCP port 22 for ssh
    to_port     = 22
    protocol =   "tcp"

    cidr_blocks =  ["0.0.0.0/0"]
  }
}
