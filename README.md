# [Terraform](https://www.terraform.io/) script launches ec2 instance on aws


## How to run?

Create a [terraform.tfvars] file in the project directory
Add the following lines 

```bash
region = "ap-south-1"
vpc_cidr_block = "10.0.0.0/16"
subnet_cidr_block = "10.0.10.0/24"
avail_zone = "ap-south-1a"
env_prefix = "development"
my_ip = "Your public IP"
machine_ami = "AMI of the instance"
usr_public_key = "Path to your public key"
```

## Usage

```terraform
terraform init
terraform validate
terraform apply
```

