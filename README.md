# terraform_launch_EC2_instance
Using terraform to automate  the setting up of an EC2 instance on AWS. This instance created will have docker installed on it, pull the Libre Translate container from Dockerhub and start the container which can now be accessed using a public IP together with the container exposed port

# Terraform Deployment Guide

This README provides instructions on how to deploy an AWS infrastructure using Terraform. Follow these steps to set up and deploy the given configuration on your own AWS instance.

## Prerequisites

Before you begin, ensure you have the following:

- An AWS account with appropriate permissions to create resources.
- AWS CLI installed and configured with your AWS credentials.
- Terraform installed on your local machine.
- SSH key pair created and the private key accessible.

## Configuration Overview

The Terraform configuration will:

- Create a security group allowing HTTP, SSH, and port 5000 access.
- Launch an EC2 instance with Docker installed.
- Run a LibreTranslate container on the EC2 instance.

## Deployment Steps

### Step 1: Clone the Repository

Clone this repository to your local machine:

```sh
git clone git@github.com:forkimenjeckayang/terraform_launch_EC2_instance.git 

git clone https://github.com/forkimenjeckayang/terraform_launch_EC2_instance.git

cd terraform_launch_EC2_instance
```

### Step 2: Initialize Terraform

Initialize Terraform to download the necessary provider plugins:

```sh
terraform init
```

### Step 3: Plan the Deployment

Create an execution plan to see what resources will be created, modified, or destroyed without making any actual changes:

```sh
terraform plan
```
### Step 4: Apply the Configuration

Apply the configuration to create the resources. Terraform will prompt you for confirmation before proceeding:

```sh
terraform apply
```
### Step 5: Confirm Deployment

After the deployment is complete, Terraform will output the instance ID and public IP of the EC2 instance. You can use the public IP to access the LibreTranslate service running on port 5000.

### Additional Notes

- Ensure your AWS credentials are properly configured and have the necessary permissions to create the specified resources.
- The SSH key specified in the configuration (test-key) should exist in your AWS account, and the private key file (test-key.pem) should be accessible at the path specified.
- Adjust the AMI ID and instance type if necessary, based on your requirements and available resources in your AWS region.

## NOTE
- You will need to create your own keys and replace in the file
- Any personall configuration should be made in account with your AWS account
