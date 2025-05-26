# devops-assessment-karishmaAbruk
# 🚀 AWS Infrastructure Setup with Terraform

This Terraform project creates a complete AWS environment including:

- SSH key pair for EC2 login
- VPC with public and private subnets
- Internet Gateway
- Route tables and associations
- Security Group with inbound rules
- EC2 instance in a public subnet with a web server installed

---

## 📦 Infrastructure Components

1. **SSH Key Pair**: Creates a key pair to log in to the EC2 instance from your local machine.
2. **VPC**: A custom Virtual Private Cloud with a /16 CIDR block.
3. **Subnets**:
   - Public Subnet (`10.0.1.0/24`)
   - Private Subnet (`10.0.2.0/24`)
4. **Internet Gateway**: Attached to the VPC for internet access.
5. **Route Tables**:
   - Public: Routes internet traffic via IGW.
   - Private: No internet route (internal-only).
6. **Security Group**:
   - Allows inbound SSH (port 22) and HTTP (port 80).
7. **EC2 Instance**:
   - Amazon Linux 2
   - Launched in the public subnet
   - Apache web server installed via `user_data`

---

## 🧰 Prerequisites

- [Terraform](https://www.terraform.io/downloads)
- AWS CLI configured (`aws configure`)
- AWS IAM user with EC2/VPC/IAM permissions

---

## ⚙️ Usage

### 1. Clone this repository

```bash
git clone https://github.com/your-repo/terraform-aws-vpc-ec2.git
cd terraform-aws-vpc-ec2
