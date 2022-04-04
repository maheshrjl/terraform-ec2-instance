# All variables defined here have to be given a value using the terraform.tfvarsfile
variable "region" {
    default = "ap-south-1" #This is the default region
}

variable "instance_count" {
    default = 1 #This is the number of instances
}

variable "vpc_cidr_block" {
    default = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
    default = "10.0.10.0/24"
}

variable "avail_zone" {
    default = "ap-south-1a" #This is the AZ in the region, all resources are created in this AZ
}

variable "env_prefix" {
    default = "development" #This is the name of the resources in format development0, development1
}

variable "usr_public_key" {
    default = "~/.ssh/id_rsa.pub"# Give a path to your public key: ~/.ssh/id_rsa.pub If not create the key using ssh-keygen
}

variable "machine_ami" {
    default = "ami-04893cdb768d0f9ee"
}

#It is recommended to create a separate terraform.tfvars file & define all variables