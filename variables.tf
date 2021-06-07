# All variables defined here have to be given a value using the terraform.tfvarsfile

variable "region" {
    default = "us-east-1" #Default value will be used unless it is updated in tfvars file
}
variable "instance_count" {
default = 2
}
variable "vpc_cidr_block" {} #"10.0.0.0/16"
variable "subnet_cidr_block" {} #"10.0.10.0/24"
variable "avail_zone" {} #"ap-south-1a"
variable "env_prefix" {} #"development"
variable "my_ip" {} #Write your ip in CIDR notation Eg: YourIpAddress/32
variable "machine_ami" {} #"ami-010aff33ed5991201"
variable "usr_public_key" {}# Give a path to your public key: ~/.ssh/id_rsa.pub If not create the key using ssh-keygen