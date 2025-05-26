variable "aws_region" {
  description = "AWS region to deploy resources"
  default     = "us-east-1"
}

variable "availability_zone" {
  description = "AWS availability zone"
  default     = "us-east-1a"
}

variable "ami_id" {
  description = "AMI ID for EC2"
  default     = "ami-0e58b56aa4d64231b" # Amazon Linux 2 (Free Tier)
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t2.micro"
}
