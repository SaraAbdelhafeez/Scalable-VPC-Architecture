# Scalable VPC Architecture

This project aims to provide a scalable VPC (Virtual Private Cloud) architecture on AWS using Ansible and Terraform. The architecture includes the deployment of a bastion host, highly available and auto-scalable application servers, NAT gateway, transit gateway, internet gateway, and other necessary components. Additionally, it sets up Cloudwatch logging and enables flow logs for monitoring.

## Installation

The installation process involves using Ansible and Terraform to provision the required infrastructure on AWS. The following components need to be installed:

- AWS CLI: Install the AWS Command Line Interface to interact with AWS services.
- Apache Web Server: Install the Apache Web Server on the deployed instances.
- Git: Install Git for version control and code management.
- Cloudwatch Agent: Install the Cloudwatch agent to monitor and push custom memory metrics to Cloudwatch.
- AWS SSM Agent: Install the AWS Systems Manager Agent for secure remote management of instances.

## Ansible Playbook

The Ansible playbook should be stored in an S3 bucket. The EC2 instances in the Auto Scaling Group will copy this playbook and execute it. Before running the playbook, Ansible needs to be installed on the EC2 instances.

## Terraform Deployment Steps

1. Build VPC network: Create a VPC network with the specified IP range (192.168.0.0/16) for the bastion host deployment and another VPC network with the IP range (172.32.0.0/16) for the highly available and auto-scalable application servers.
2. Create NAT Gateway and update route tables: Create a NAT Gateway in the public subnet and update the route tables of the private subnets to route default traffic through the NAT Gateway for outbound internet connection.
3. Create Transit Gateway: Create a Transit Gateway and associate both VPCs to it for private communication.
4. Create Internet Gateway: Create an Internet Gateway for each VPC and update the route tables of the public subnets to route default traffic through the Internet Gateway for inbound/outbound internet connection.
5. Create Cloudwatch Log Group and enable Flow Logs: Create a Cloudwatch Log Group with two Log Streams to store the VPC Flow Logs of both VPCs. Enable Flow Logs for both VPCs and push the logs to the respective Log Streams in the Cloudwatch Log Group.
6. Create Security Group for the bastion host: Create a Security Group allowing inbound traffic on port 22 from the public.
7. Deploy Bastion Host EC2 instance: Deploy an EC2 instance for the bastion host in the public subnet with an associated Elastic IP (EIP).
8. Create S3 Bucket: Create an S3 Bucket to store application-specific configurations.
9. Create Launch Configuration: Create a Launch Configuration with the following configuration: 
   - Instance Type: t2.micro
   - Userdata: Pull the code from the s3 bucket to the document root folder of the webserver and start the httpd service.
   - IAM Role: Grant access to Session Manager and the S3 bucket.
   - Security Group: Allow inbound traffic on port 22 from the Bastion Host and port 80 from the public.
   - Key Pair: Specify the key pair for SSH access.
10. Create Auto Scaling Group: Create an Auto Scaling Group with a minimum of 2 and a maximum of 4 instances. Associate two private subnets with availability zones 1a and 1b.
11. Create Target Group: Create a Target Group and associate it with the Auto Scaling Group.
12. Create Network Load Balancer: Create a Network Load Balancer in the public subnet and add the Target Group as a target.
13. Update Route53 Hosted Zone: Update the Route53 hosted zone with a CNAME record to route traffic to the Network Load Balancer.

## Disclaimer

This project is provided as-is and does not guarantee the availability, functionality, or security of the deployed infrastructure. Use it at your own risk and ensure proper testing and validation before deploying in a production environment.
