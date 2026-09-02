# ☁️ Azure Virtual Machine Infrastructure with Terraform

![Terraform](https://img.shields.io/badge/Terraform-IaC-7B42BC?logo=terraform\&logoColor=white)
![Microsoft Azure](https://img.shields.io/badge/Microsoft%20Azure-Cloud-0078D4?logo=microsoftazure\&logoColor=white)
![Infrastructure as Code](https://img.shields.io/badge/Infrastructure-as--Code-blue)
![License](https://img.shields.io/badge/License-MIT-green)

A modular **Infrastructure as Code (IaC)** project for provisioning and managing **Azure Virtual Machine infrastructure using Terraform**.

The project follows a reusable **parent-child module architecture**, allowing Azure infrastructure components to be provisioned in a structured, scalable, and maintainable way.

---

## 📌 Project Overview

This project demonstrates how to provision an Azure Virtual Machine environment using **Terraform modules** instead of managing resources manually through the Azure Portal.

The infrastructure is divided into reusable Terraform modules for:

* Azure Resource Group
* Azure Virtual Network
* Azure Subnet
* Azure Public IP
* Azure Virtual Machine

The **Child Folder** contains reusable infrastructure modules, while the **Parent Folder** acts as the root Terraform configuration that consumes these modules.

This modular approach improves:

* ♻️ Reusability
* 🧩 Maintainability
* 📈 Scalability
* 🔐 Infrastructure consistency
* ⚙️ Deployment automation
* 📋 Infrastructure version control

---

## 🏗️ Architecture

```text
                    ┌──────────────────────┐
                    │       Terraform      │
                    │    Parent Folder     │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │   Resource Group     │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │   Virtual Network    │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │       Subnet         │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │      Public IP       │
                    └──────────┬───────────┘
                               │
                               ▼
                    ┌──────────────────────┐
                    │   Azure Virtual      │
                    │      Machine         │
                    └──────────────────────┘
```

### Infrastructure Flow

```text
Resource Group
      ↓
Virtual Network
      ↓
Subnet
      ↓
Public IP
      ↓
Virtual Machine
```

Terraform manages the infrastructure using resource dependencies and module-based configuration.

---

## 📂 Repository Structure

```text
Azure-Virtual-Machine/
│
├── Shikhar-Landing Zone/
│   │
│   ├── Child Folder/
│   │   │
│   │   ├── azurerm_resource_group/
│   │   ├── azurerm_virtual_network/
│   │   ├── azurerm_subnet/
│   │   ├── azurerm_public_IP/
│   │   └── azurerm_virtual_machine/
│   │
│   └── Parent Folder/
│       │
│       ├── main.tf
│       ├── provider.tf
│       ├── variable.tf
│       ├── terraform.tfvars
│       └── .terraform.lock.hcl
│
├── .gitignore
└── README.md
```

---

## 🧩 Terraform Module Design

The project uses a **parent-child module architecture**.

### Child Modules

The child modules contain the actual Terraform resource definitions.

| Module                    | Purpose                       |
| ------------------------- | ----------------------------- |
| `azurerm_resource_group`  | Creates Azure Resource Group  |
| `azurerm_virtual_network` | Creates Virtual Network       |
| `azurerm_subnet`          | Creates Subnet                |
| `azurerm_public_IP`       | Creates Public IP             |
| `azurerm_virtual_machine` | Creates Azure Virtual Machine |

### Parent Module

The Parent Folder consumes these reusable modules and provides the required variable values.

This separation keeps infrastructure code organized and makes individual modules reusable across different environments.

---

## ⚙️ Technologies Used

| Technology           | Purpose                          |
| -------------------- | -------------------------------- |
| **Microsoft Azure**  | Cloud infrastructure platform    |
| **Terraform**        | Infrastructure as Code           |
| **AzureRM Provider** | Terraform integration with Azure |
| **Git**              | Version control                  |
| **GitHub**           | Source code management           |

---

## 🚀 Prerequisites

Before deploying this infrastructure, make sure the following are installed and configured:

* [Terraform](https://developer.hashicorp.com/terraform)
* Azure CLI
* An active Azure subscription
* Git
* An Azure account with sufficient permissions to create resources

Verify Terraform:

```bash
terraform version
```

Verify Azure CLI:

```bash
az version
```

Authenticate with Azure:

```bash
az login
```

---

## 🔧 Configuration

Navigate to the Terraform root directory:

```bash
cd "Shikhar-Landing Zone/Parent Folder"
```

Review the variables and provide the required Azure configuration.

For security, **do not commit credentials, passwords, client secrets, or other sensitive values to GitHub**.

A recommended approach is to keep sensitive values outside the repository and provide them through environment variables, Azure authentication mechanisms, or a local `.tfvars` file that is excluded through `.gitignore`.

---

## ▶️ Terraform Workflow

### 1. Initialize Terraform

```bash
terraform init
```

This initializes the Terraform working directory and downloads the required providers and modules.

---

### 2. Format Terraform Code

```bash
terraform fmt -recursive
```

Formats Terraform configuration files according to standard Terraform formatting conventions.

---

### 3. Validate Configuration

```bash
terraform validate
```

Checks whether the Terraform configuration is syntactically valid and internally consistent.

---

### 4. Review Execution Plan

```bash
terraform plan
```

Generates an execution plan showing the infrastructure changes Terraform intends to make.

---

### 5. Provision Infrastructure

```bash
terraform apply
```

Apply the plan and provision the Azure infrastructure.

---

### 6. Destroy Infrastructure

When the infrastructure is no longer required:

```bash
terraform destroy
```

> ⚠️ Use `terraform destroy` carefully because it removes the resources managed by the Terraform configuration.

---

## 🔗 Resource Dependencies

The infrastructure follows a logical dependency chain:

```text
Resource Group
      ↓
Virtual Network
      ↓
Subnet
      ↓
Public IP
      ↓
Virtual Machine
```

Terraform automatically handles dependencies where they can be inferred from resource references.

Where an explicit dependency is required, Terraform's `depends_on` mechanism can be used to define the intended provisioning order.

---

## 🔐 Security Best Practices

Security is an important part of infrastructure management.

### Secrets Management

Never commit the following to a public repository:

```text
Passwords
API Keys
Client Secrets
Service Principal Credentials
Private Keys
Terraform State Files
```

Sensitive Terraform variable files should be excluded using `.gitignore`.

Example:

```gitignore
*.tfvars
*.tfvars.json

*.tfstate
*.tfstate.*

.terraform/
```

An example configuration can be provided using:

```text
terraform.tfvars.example
```

with placeholder values instead of real credentials.

### Recommended Authentication

For production environments, prefer secure Azure authentication mechanisms such as:

* Azure CLI authentication
* Managed Identity
* Workload Identity
* Service Principal with securely stored credentials
* Azure Key Vault

---

## 🗃️ Terraform State

Terraform uses a state file to track infrastructure resources managed by Terraform.

For production or team environments, a **remote backend** such as Azure Storage is recommended instead of keeping Terraform state only on a local machine.

Benefits include:

* Centralized state management
* Team collaboration
* State locking
* Better recovery
* Reduced risk of local state loss

---

## 📈 Scalability

The modular architecture allows additional infrastructure components to be added without significantly changing the overall project structure.

Future modules can include:

```text
Network Security Group
        ↓
Network Interface
        ↓
Load Balancer
        ↓
Azure Bastion
        ↓
Key Vault
        ↓
Monitoring
```

The same modules can also be reused across multiple environments such as:

```text
Development
     ↓
Testing
     ↓
Staging
     ↓
Production
```

---

## 🎯 Key Learning Outcomes

This project demonstrates practical knowledge of:

* Infrastructure as Code
* Terraform fundamentals
* Terraform modules
* Parent-child module architecture
* Azure resource provisioning
* Terraform variables
* Resource dependencies
* Explicit and implicit dependencies
* Terraform state management
* Infrastructure version control
* Modular infrastructure design
* Secure infrastructure practices

---

## 🛠️ Possible Improvements

The project can be further enhanced with:

* Remote Terraform backend using Azure Storage
* Azure Key Vault integration
* Network Security Groups
* Private networking
* Managed Identity
* Environment-specific Terraform configurations
* Terraform input validation
* Output variables
* Automated security scanning
* Infrastructure documentation and architecture diagrams

---

## 📚 Useful Commands

```bash
# Initialize
terraform init

# Format
terraform fmt -recursive

# Validate
terraform validate

# Preview changes
terraform plan

# Deploy infrastructure
terraform apply

# Show managed resources
terraform state list

# Destroy infrastructure
terraform destroy
```

---

## 👨‍💻 Author

**Shikhar Tiwari**

DevOps Engineer | Microsoft Azure | Terraform | Infrastructure as Code

* GitHub: [Shikhar-ctrl](https://github.com/Shikhar-ctrl)
* Repository: [Azure Virtual Machine](https://github.com/Shikhar-ctrl/Azure-Virtual-Machine)

---

## 📄 License

This project is licensed under the **MIT License**.

---

⭐ If you find this project useful, feel free to star the repository.
