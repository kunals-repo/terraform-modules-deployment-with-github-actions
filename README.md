# 🚀 Azure Storage Deployment using Terraform Modules & GitHub Actions (Self-Hosted Runner + Remote Backend)

## 📌 Project Overview

This project demonstrates an end-to-end **CI/CD pipeline** for deploying Azure infrastructure using **Terraform modules** integrated with **GitHub Actions**.

We successfully deployed:

* **3 Azure Storage Accounts**
* **Blob Containers**
* **Blobs (files)**

The pipeline is automatically triggered when changes are pushed to:

* `main.tf`
* `terraform.tfvars`

A **remote backend** is configured to securely manage the Terraform state file, and the pipeline runs on a **self-hosted runner** for better control and security.

---

## 🧰 Tools & Technologies Used

* **Git** – Version control system

* **GitHub** – Repository & CI/CD pipeline hosting
  
* **Terraform Modules** – Reusable Infrastructure as Code components
  
* **Terraform Remote Backend (Azure Storage)** – Centralized state management
  
* **GitHub Actions** – CI/CD automation
  
* **Microsoft Azure** – Cloud platform for resource deployment
  
* **Self-Hosted Runner** – Executes pipeline jobs in a controlled environment

---

## ⚙️ CI/CD Pipeline Workflow

1. Write Terraform code
   
2. Code is pushed to the GitHub repository
  
3. GitHub Actions pipeline is triggered automatically
   
4. Pipeline runs on a **self-hosted runner**
   
5. Workflow executes the following steps:

   * Checkout source code
   * Setup Terraform CLI
   * Authenticate with Azure
   * Initialize Terraform with **remote backend**
   * Run `terraform plan`
   * Run `terraform apply`
     
6. Azure resources are created/updated:

   * Storage Accounts
   * Containers
   * Blobs

---


## ✅ Advantages of This Approach

### 🔹 Automation

* Fully automated infrastructure provisioning
* Eliminates manual deployment errors

### 🔹 Reusability

* Terraform modules enable reusable and scalable code

### 🔹 Consistency

* Same infrastructure deployed every time
* Avoids configuration drift

### 🔹 Security

* Remote backend protects state file
* Self-hosted runner runs in controlled environment

### 🔹 Collaboration

* Centralized state enables team-based development

### 🔹 Scalability

* Easily extend to multiple environments (Dev, Test, Prod)

### 🔹 Version Control

* Infrastructure changes tracked using Git

---

## 🧠 Key Learnings

* Using Terraform modules for scalable infrastructure
  
* Integrating Terraform with GitHub Actions
  
* Configuring Terraform remote backend in Azure
  
* Setting up and using a self-hosted runner
  
* Automating Azure resource deployment with CI/CD

