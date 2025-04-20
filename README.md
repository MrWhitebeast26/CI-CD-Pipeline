# 🚀 GCP CI/CD Pipeline with Terraform and Jenkins

This repository contains a CI/CD pipeline setup using **Terraform**, **Jenkins**, and **Google Cloud Run**. The pipeline builds a Docker image, pushes it to Google Container Registry (GCR), and deploys it to Cloud Run using Terraform.

## 🧱 Folder Structure

```
.
├── terraform.tf         # Terraform provider & backend
├── values.tf            # Input variables
├── main.tf              # GCP Cloud Run deployment resources
├── Jenkinsfile          # Jenkins pipeline steps
└── README.md            # Project documentation
```

## ⚙️ Prerequisites

- [Google Cloud SDK](https://cloud.google.com/sdk/docs/install)
- [Terraform](https://www.terraform.io/downloads)
- [Docker](https://www.docker.com/)
- Jenkins server with:
  - Docker installed
  - Service account key stored as secret (`gcp-service-account-key`)

## ☁️ Setup Steps

### 1. Configure GCP

```bash
gcloud services enable cloudbuild.googleapis.com run.googleapis.com containerregistry.googleapis.com
gsutil mb -l us-central1 gs://YOUR_STATE_BUCKET_NAME
```

### 2. Terraform Init & Apply

```bash
terraform init
terraform apply -var="project_id=your-gcp-project-id" -var="docker_image=gcr.io/your-project-id/image-name"
```

### 3. Jenkins Pipeline

Ensure Jenkins is set up with Docker and the correct credentials. On push, Jenkins will:
- Build Docker image
- Push to GCR
- Deploy to Cloud Run

## ✅ Output

Terraform will print the URL of your deployed Cloud Run service.

## 🛡️ Security Note

Never commit secrets or service account keys. Use Jenkins secrets.

---