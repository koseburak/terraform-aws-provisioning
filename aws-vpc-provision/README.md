<div id="top"></div>
<!--
*** Thanks for checking out this project developed using terraform integrated with AWS Amazon. If you have a suggestion
*** that would make this better, please fork the repo and create a pull request
*** or simply open an issue with the tag "enhancement".
*** Don't forget to give the project a star!
*** Thanks again!
-->

<!-- INTRODUCTION -->
## Building the VPC (Virtual Private Cloud) using Terraform on the AWS

Initialize the VPC (Virtual Private Cloud) on the AWS using Terraform.
</br>
</br>

<!-- ABOUT THE PROJECT -->
## About The Project

This project provide to creation the VPC (Virtual Private Cloud) on AWS using Terraform.

It's building;

* **Virtual Private Cloud**\
    Virtual Private Cloud is created that your infrastructure will use

* **Elastic File System (EFS)**  
  * NFS file system is created for use with EC2 Instances
  * Mount target is created in each Availability Zone to mount from EC2 Instances

* **Subnet**\
  Subnet is created for each Availability Zone an IP range in VPC

* **Internet Gateway**\
  Internet Gateway is created to provide the communication between VPC and Internet

* **Security Group**\
  Security Group is created to define and manage Inbound/Outbound access of servers as a virtual firewall
  * Ingress:
    * Define the limited SSH access from the specific source IP address \
    * Define the NFS access to mount Elastic File System storage \
  * Egress:
    * Define All traffic access for Instances using this Security Group

* **Route Table**\
  Route Table is created to will be determine where network traffic from your subnet or gateway is directed

* **EC2 Instance**\
  At least one EC2 Instance is created in each availability zone to provide service.

![aws-vpc-diagram](assets/terraform-aws-vpc-diagram.png)
</br>
</br>

<!-- RUNNING -->
## Running

If you have [Terraform](https://www.terraform.io/) installed, you can run the
above example with the following commands.

1. Run the below command in a terminal, to initialize the provider plugins:

    ```console
    terraform init
    ```

2. Run the below command in a terminal, to check your configuration is valid:

    ```console
    terraform validate
    ```

3. Run the below command in a terminal to show changes required by the current configuration:

    ```console
    terraform plan
    ```

4. Run the below command in a terminal, to Create or Update infrastructure on the AWS:

    ```console
    terraform apply
    ```

5. Run the below command in a terminal, to Destroy previously-created infrastructure on the AWS:

    ```console
    terraform destroy
    ```

## Used AWS Services and Features

* EC2
  * Instances
    * Security Group
    * Volumes
* VPC
  * Subnet
  * Route Tables
    * Internet Gateways
* EFS
  * Elastic File System
