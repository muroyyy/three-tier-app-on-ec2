# 🛠️ Three-Tier Web App on AWS (Terraform + Docker)

This project deploys a secure and scalable **three-tier web application** on **AWS** using **Terraform** and **Docker**. It follows cloud-native best practices for production-grade infrastructure.

## 🚀 Tech Stack

- **Frontend**: React
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

```bash
.
├── README.md
├── backend
│   ├── Dockerfile
│   ├── index.js
│   ├── node_modules
│   ├── package-lock.json
│   └── package.json
├── docker-compose.yml
├── frontend
│   ├── Dockerfile
│   ├── README.md
│   ├── node_modules
│   ├── package-lock.json
│   ├── package.json
│   ├── public
│   └── src
├── nginx
│   └── nginx.conf
├── terraform.tfstate
└── terraform_files
    ├── main.tf
    ├── modules
    ├── outputs.tf
    ├── package-lock.json
    ├── package.json
    ├── provider.tf
    ├── terraform.tfstate
    ├── terraform.tfstate.backup
    ├── terraform.tfvars
    └── variables.tf
```

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
    ```bash 
    terraform apply
   
4. 🔑 SSM into the EC2:
    ```bash
    aws ssm start-session --target <instance-id>

5. 🐳 Inside EC2, deploy the app:
    ```bash
    git clone https://github.com/muroyyy/three-tier-app-on-ec2.git
    cd three-tier-app-on-ec2
    sudo docker-compose up -d

6. 🌐 Open your browser:
    ```bash
    http://<alb-dns-name>

    Find the alb-dns-name by typing "terraform output alb_dns" inside the terraform root directory.

---

✅ When to Use

✅ Best for:

- Fullstack apps (React + API)
- Projects that require backend security
- Production-like testing environments

❌ Not ideal for:

Static-only sites (Use S3 + CloudFront instead)
