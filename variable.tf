variable "region" {}


variable "ec2_ami" {
 type = map
 default = {
    us-east-1 = "ami-0aeeebd8d2ab47354"
    eu-central-1 = "ami-0bad4a5e987bdebde"
  }
}
