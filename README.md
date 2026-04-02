# Azure Secure Infrastructure with Terraform

## 📌 Overview
This project demonstrates the deployment of a secure and modular Azure infrastructure using Terraform.

The goal is to apply infrastructure-as-code (IaC) principles alongside security best practices, including network segmentation and controlled access using Network Security Groups (NSGs).

The infrastructure is designed using reusable modules for scalability and maintainability.

## 🏗️ Architecture

The infrastructure is organized using a modular design to separate responsibilities and improve scalability.

### Components:
- **Resource Group** – Container for all Azure resources
- **Virtual Network (VNet)** – Provides network isolation
- **Subnet** – Segments the network for better control
- **Network Security Group (NSG)** – Enforces inbound and outbound security rules
- **Compute Module (VM)** – Defined and validated via Terraform (not deployed due to subscription constraints)

### Design Principles:
- Modular Terraform structure
- Reusable components
- Separation of concerns (network vs compute)
- Security-first approach

## 📁 Terraform Structure

The project follows a modular Terraform structure to improve reusability and maintainability.

### Root Module
- Defines providers and core configuration
- Calls child modules (network and compute)
- Passes variables between modules

### Modules

#### Network Module
- Creates Virtual Network (VNet)
- Defines Subnet
- Configures Network Security Group (NSG)
- Associates NSG with Subnet

#### Compute Module
- Defines Linux Virtual Machine configuration
- Uses dynamic naming conventions
- Accepts network inputs (subnet ID)

### Key Features
- Use of input variables for flexibility
- Output values for inter-module communication
- Local values for naming standardization

