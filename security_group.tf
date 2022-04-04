data "http" "myip" {
    url = "http://ipv4.icanhazip.com"
    #Retrieve IP address & use it to create security group
}

resource "aws_security_group" "ec2-sec-group" {
  vpc_id = aws_vpc.ec2-vpc.id
  name   = "SSH-incoming-sg"
  ingress = [{
    cidr_blocks      = ["${chomp(data.http.myip.body)}/32"]
    #Allow inbound ssh on current machine IP
    description      = "Allows SSH connection to VM"
    from_port        = 22
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "tcp"
    security_groups  = []
    self             = false
    to_port          = 22
  }]

  egress = [{
    cidr_blocks      = ["0.0.0.0/0"]
    description      = ""
    from_port        = 0
    ipv6_cidr_blocks = []
    prefix_list_ids  = []
    protocol         = "-1"
    security_groups  = []
    self             = false
    to_port          = 0
    prefix_list_ids  = []
  }]
  tags = {
    "Name" = "${var.env_prefix}-psecurity-gr"
  }
}