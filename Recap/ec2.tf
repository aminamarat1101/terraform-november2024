data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_vpc" "selected" {
  default = true
}

data "aws_subnet" "selected" {
  vpc_id = data.aws_vpc.selected.id

filter {
    name = "availability-zone"
    values = ["us-east-1a"]
  }
}

resource "aws_instance" "web" {
  ami           = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  subnet_id = data.aws_subnet.selected.id

  tags = local.common_tags
}