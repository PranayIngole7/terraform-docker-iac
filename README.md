# Infrastructure as Code (IaC) with Terraform & Docker

## Objective
Demonstrate Infrastructure as Code (IaC) principles by declaratively provisioning, inspecting, and destroying a local Nginx Docker container lifecycle using HashiCorp Terraform.

---

## Architecture & Workflow

```text
+-------------------+       +-----------------------+       +----------------------+
|  Terraform Code   | ----> |  Terraform Core Engine| ----> | Local Docker Engine  |
|     (main.tf)     |       |  (State & DAG Graph)  |       |  (/var/run/docker)   |
+-------------------+       +-----------------------+       +----------------------+
                                                                       |
                                                                       v
                                                           [ Nginx Container:8080 ]
```
---

## Tech Stack & Tools

- **IaC Tool**: HashiCorp Terraform (>= v1.2.0)
- **Container Engine**: Docker Community Edition
- **Terraform Provider**: kreuzwerker/docker (~> 3.0.0)
- **Base Image**: nginx:latest
- **Version Control**: Git / GitHub
---

## Repository Structure

```text

terraform-docker-iac/
├── .gitignore               # State file and credential exclusion rules
├── README.md                # Project documentation 
├── main.tf                  # HCL definitions for provider, image, and container
└── execution_logs/          # Verifiable CLI outputs for each IaC lifecycle step
    ├── 01_terraform_init.log
    ├── 02_terraform_plan.log
    ├── 03_terraform_apply.log
    ├── 04_terraform_state_list.log
    ├── 05_terraform_state_show.log
    └── 06_terraform_destroy.log
```
---
## How to Run

### Prerequisites

Ensure Terraform and Docker are installed and the Docker daemon is running:

```bash
docker --version
terraform -v
```
### Steps to Execute

**Initialize Provider & Modules:**
```bash
terraform init
```

**Generate Dry-Run Plan:**
```bash
terraform plan
```

**Apply Configuration:**
```bash
terraform apply -auto-approve
```

**Verify Running Container:**
```bash
curl -I http://localhost:8080
```

**Inspect Managed State:**
```bash
terraform state list
terraform state show docker_container.nginx
```

**Teardown Infrastructure:**
```bash
terraform destroy -auto-approve
```
