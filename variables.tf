
variable "region" {
  description = "Name of your region"
  default     = "us-west-1"
}

variable "availability_zone" {
  description = "The availability zone to deploy resources"
  type        = string
  default     = "us-west-1a"  # Default value can be changed as needed
}

variable "vpc_cidr_block" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet_cidr_block" {
  description = "The CIDR block for the Subnet"
  type        = string
  default     = "10.0.1.0/24"
}

variable "project_name" {
  description = "Name of your project"
  default     = "bucketlist"
}

variable "solution_stack_name" {
  description = "Name of solution stack"
  default     = "64bit Amazon Linux 2023 v5.1.8 running Tomcat 10 Corretto 17"
}


variable "bucket_key" {
  description = "Name of key of artifact"
  default     = "my-codebuild-project/bucketlist.war"
}
