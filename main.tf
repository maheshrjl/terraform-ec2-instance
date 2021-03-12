provider "aws" {
    region = var.region
}

variable "region" {}
variable "vpc_cidr_block" {}
variable "subnet_cidr_block" {}
variable "avail_zone" {}
variable "env_prefix" {}
variable "my_ip" {}
variable "machine_ami" {}
variable "usr_public_key" {}

resource "aws_vpc" "ec2-vpc" {
    cidr_block = var.vpc_cidr_block
    tags = {
      "Name" = "${var.env_prefix}-vpc"
    }
}

resource "aws_subnet" "ec2-subnet" {
    vpc_id = aws_vpc.ec2-vpc.id
    cidr_block = var.subnet_cidr_block
    availability_zone = var.avail_zone
    tags = {
      "Name" = "${var.env_prefix}-subnet"
    }
}

resource "aws_internet_gateway" "ec2-internet-gateway" {
    vpc_id = aws_vpc.ec2-vpc.id
    tags = {
      "Name" = "${var.env_prefix}-igw"
    }
}

resource "aws_route_table" "ec2-rtb" {
    vpc_id = aws_vpc.ec2-vpc.id
    route = [{
      cidr_block = "0.0.0.0/0"
      egress_only_gateway_id = ""
      gateway_id = aws_internet_gateway.ec2-internet-gateway.id
      instance_id = ""
      ipv6_cidr_block = ""
      local_gateway_id = ""
      nat_gateway_id = ""
      network_interface_id = ""
      transit_gateway_id = ""
      vpc_endpoint_id = ""
      vpc_peering_connection_id = ""
    } ]
    tags = {
      "Name" = "${var.env_prefix}-route-table"
    }
}

resource "aws_route_table_association" "ec2-rtb-assoc" {
    subnet_id = aws_subnet.ec2-subnet.id
    route_table_id = aws_route_table.ec2-rtb.id
}

resource "aws_security_group" "ec2-sec-group" {
    vpc_id = aws_vpc.ec2-vpc.id
    name = "SSH-incoming-sg"
    ingress = [ {
      cidr_blocks = [ var.my_ip ]
      description = "Allows incoming ssh to machine"
      from_port = 22
      ipv6_cidr_blocks = [  ]
      prefix_list_ids = [  ]
      protocol = "tcp"
      security_groups = [  ]
      self = false
      to_port = 22
    } ]

    egress = [ {
      cidr_blocks = [ "0.0.0.0/0" ]
      description = ""
      from_port = 0
      ipv6_cidr_blocks = [  ]
      prefix_list_ids = [  ]
      protocol = "-1"
      security_groups = [  ]
      self = false
      to_port = 0
      prefix_list_ids = [ ]
    } ]
    tags = {
      "Name" = "${var.env_prefix}-security-grp"
    }
}

resource "aws_key_pair" "ssh-key" {
    key_name = "trf-key-pair"
    public_key = file(var.usr_public_key)
}

resource "aws_instance" "ec2-server" {
    ami = var.machine_ami
    instance_type = "t2.micro"
    subnet_id = aws_subnet.ec2-subnet.id
    vpc_security_group_ids = [aws_security_group.ec2-sec-group.id]
    availability_zone = var.avail_zone
    associate_public_ip_address = true
    key_name = aws_key_pair.ssh-key.key_name
    tags = {
      "Name" = "${var.env_prefix}-server"
    }
}

output "ec2_public_ip" {
    value = aws_instance.ec2-server.public_ip
}