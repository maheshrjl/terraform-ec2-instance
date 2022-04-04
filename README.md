# [Terraform](https://www.terraform.io/) script launches ec2 instance on aws


## How to run?

Create a [terraform.tfvars] file in the project directory & provide values to variables from the variables.tf file [Optional]


## Usage

```terraform
terraform init
terraform validate
terraform apply
```

## Connecting to Instances?
`ssh ec2-user@public-ip-address
`


# Coded in Terraform v0.14.7
### Tested in Terraform v1.1.7/aws v4.8.0