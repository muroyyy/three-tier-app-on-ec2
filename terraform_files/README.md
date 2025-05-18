# 🛠️ Three-Tier Web App on AWS (Terraform + Docker)

This project deploys a secure and scalable **three-tier web application** on **AWS** using **Terraform** and **Docker**. It follows cloud-native best practices for production-grade infrastructure.

## 🚀 Tech Stack

- **Frontend**: React + Tailwind CSS
- **Backend**: Node.js (Express or similar)
- **Infrastructure**: 
  - AWS EC2 (Private Subnet)
  - AWS ALB (Public Subnets)
  - AWS VPC with NAT Gateway
  - Docker + Docker Compose
  - AWS Systems Manager (SSM)
  - Terraform (Modularized)

---

## 📦 Project Structure

terraform_files/
├── main.tf
├── variables.tf
├── outputs.tf
├── terraform.tfvars
├── modules/
│ ├── networking/
│ ├── ec2/
│ └── alb/
├── scripts/
│ └── install.sh


---

## 🔐 Architecture Overview

- **Nginx** runs in a container and serves as a **reverse proxy**
- **Frontend & Backend** are served behind Nginx
- **ALB** accepts HTTP traffic and forwards it to Nginx
- **SSM Agent** allows secure EC2 access (no SSH required)
- EC2 has no public IP; outbound traffic flows via **NAT Gateway**

---

## 🧪 How to Deploy

1. 🧱 Clone the repo and `cd terraform_files/`

2. ⚙️ Initialize Terraform:
   ```bash
   terraform init
3. 📦 Apply the infrastructure:

    terraform apply

4. 🔑 SSM into the EC2:

    aws ssm start-session --target <instance-id>

5. 🐳 Inside EC2, deploy the app:

    git clone https://github.com/<your-username>/three-tier-app-on-ec2.git
    cd three-tier-app-on-ec2
    sudo docker-compose up -d

6. 🌐 Open your browser:

    http://<alb-dns-name>

    Find the alb-dns-name by typing "terraform output alb_dns" inside the terraform root directory.

---

✅ When to Use
✅ Best for:

Fullstack apps (React + API)

Projects that require backend security

Production-like testing environments

❌ Not ideal for:

Static-only sites (Use S3 + CloudFront instead)
