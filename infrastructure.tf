provider "aws" {
  profile = "chef-engineering"
  region  = "us-west-2"
}

resource "aws_instance" "chef-analyze-node" {
  count                  = "1"
  ami                    = "ami-0994c095691a46fb5" // ubuntu 16.04
  key_name               = "afiune"
  instance_type          = "t2.micro"
  subnet_id              = "subnet-075cf68e70020ac62"
  vpc_security_group_ids = ["sg-0d543c10d209cd4e0"]
  tags                   = {
    Name                 = "chef-analyze-node-${count.index + 1}"
		X-Dept               = "core-engineering"
		X-Contact            = "afiune@chef.io"
  }
}
