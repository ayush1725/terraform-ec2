# 🚀 terraform-ec2

Terraform configuration for provisioning an **EC2 instance on AWS** with an optional setup script to install **Nginx**. This repository demonstrates infrastructure automation using **Terraform**.

---

## 📦 Project Structure

```bash
.
├── ec2.tf                # Main EC2 instance configuration
├── install_nginx.sh      # Shell script to install and start Nginx on the EC2 instance
├── outputs.tf            # Outputs like public IP of the instance
├── providers.tf          # AWS provider configuration
├── terraform.tf          # Backend config (if used)
├── variables.tf          # All configurable variables
├── .gitignore            # Ignoring state files and sensitive data
├── terra-key-ec2         # Private key for SSH (DO NOT COMMIT TO PUBLIC REPOS)
├── terra-key-ec2.pub     # Public key used by EC2
```
# ⚙️ Prerequisites
- AWS Account with access key and secret
- Terraform installed (v1.0+ recommended)
- IAM permissions to manage EC2
- SSH key (already generated as `terra-key-ec2`)

## 🛠️ Setup Instructions

1. **Clone the repository**
   ```bash
   git clone https://github.com/ayush1725/terraform-ec2.git
   cd terraform-ec2
   ```
2. **Configure AWS Credentials**
Set up AWS credentials in your terminal or using a profile:
  ```bash
     export AWS_ACCESS_KEY_ID="your-access-key"
     export AWS_SECRET_ACCESS_KEY="your-secret-key"
  ```
3. **Initialize Terraform**
   `terraform init`
   
4. **Validate the Configuration**
   ```bash
     terraform validate
  ``
5.  **Plan the Infrastructure**
   ```bash
   terraform plan
   ```
6. **Apply the Configuration**
   ```bash
   terraform apply -auto-approve
   ```
7. **Access the EC2 Instance**
   ***Use the output public IP to SSH:***
   ```bash
   ssh -i terra-key-ec2 ec2-user@<public-ip-from-output>
   ```
8. **Destroy Resources (Optional)**
   ***When you're done, tear down the infrastructure to avoid charges:***
   ```bash
   terraform destroy -auto-approve
   ```
---
