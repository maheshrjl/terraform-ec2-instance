variable "region" {
    default = "us-east-1" #Default value will be used unless it is updated in tfvars file
}
variable "vpc_cidr_block" {}
variable "subnet_cidr_block" {}
variable "avail_zone" {}
variable "env_prefix" {}
variable "my_ip" {} #Write your ip in CIDR notation Eg: YourIpAddress/32
variable "machine_ami" {}
variable "usr_public_key" {}