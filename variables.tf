# All variables defined here have to be given a value using the terraform.tfvarsfile
variable "region" {
    default = "ap-south-1"
}
variable "instance_count" {
    default = 2
}
variable "vpc_cidr_block" {
    default = "10.0.0.0/16"
}
variable "subnet_cidr_block" {
    default = "10.0.10.0/24"
}
variable "avail_zone" {
    default = "ap-south-1a"
}
variable "env_prefix" {
    default = "development"
}
variable "usr_public_key" {
    default = "~/.ssh/id_rsa.pub"
}# Give a path to your public key: ~/.ssh/id_rsa.pub If not create the key using ssh-keygen
variable "my_ip" {} #Write your ip in CIDR notation Eg: YourIpAddress/32
variable "machine_ami" {} #"ami-010aff33ed5991201"