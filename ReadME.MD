Description
This repository contains Terraform code to deploy an AWS EC2 instance with a specified security group. The Terraform configuration creates an EC2 instance, a key pair for SSH access, and a security group with customizable inbound ports. The instance is provisioned with a user data script that runs after launch.

Prerequisites
Before using this Terraform code, ensure you have the following prerequisites:

An AWS account with appropriate access credentials (access_key and secret_key).
Terraform installed on your local machine.
An existing SSH key pair in your AWS account. The key pair name should be provided in the terraform.tfvars file.
Usage
Clone this Git repository to your local machine.
Make sure you have the necessary AWS credentials set up (either via environment variables or using AWS CLI configuration).
Create a file named terraform.tfvars in the repository root with the required variables:
hcl
Copy code
region = "us-east-1"    # Replace with your desired AWS region
instance_type = "t2.micro"
ports = [22, 80, 443, 3306, 27017]   # Customize the list of inbound ports as needed
ami = "ami-053b0d53c279acc90"   # Replace with your desired AMI ID
access_key = "YOUR_ACCESS_KEY"   # Replace with your actual AWS access key
secret_key = "YOUR_SECRET_KEY"   # Replace with your actual AWS secret key
In the repository root, execute the following commands:
bash
Copy code
terraform init       # Initialize Terraform and download the AWS provider
terraform apply      # Preview the changes and deploy the infrastructure
If you are satisfied with the changes, type yes to proceed with the deployment.
Files Description
instance.tf: Defines the AWS EC2 instance and associates it with the specified security group. It also attaches the user data script for configuration.
key.tf: Creates an AWS key pair using the public key stored in the repository. This key pair will be used for SSH access to the EC2 instance.
provider: Configures the AWS provider with the desired region (us-east-1 in this case).
script1.sh: A shell script that will be executed on the EC2 instance during provisioning.
sg.tf: Defines the AWS security group with customizable inbound ports.
variables.tf: Defines the input variables used in the Terraform configuration.
terraform.tfvars: Contains the values for input variables, such as region, instance type, ports, AMI, and AWS credentials.
Customization
You can customize the Terraform configuration by modifying the terraform.tfvars file to set your desired values for region, instance type, ports, AMI, and AWS credentials. Additionally, you can modify the script1.sh file to include any custom commands you want to run on the EC2 instance during provisioning.

Remember to follow best security practices and keep sensitive information (e.g., AWS access keys) secure.

Cleaning Up
To remove the created resources and clean up, execute the following command:

bash
Copy code
terraform destroy    # Destroy the deployed infrastructure
Again, type yes to confirm the destruction of resources.

Note: Make sure to review and confirm the Terraform plan before applying any changes or destroying the infrastructure to prevent accidental data loss.

Disclaimer
This Terraform code is provided as-is, and the author is not responsible for any damages or liabilities caused by using this code. Use it at your own risk, and be cautious when deploying resources in your AWS account.





