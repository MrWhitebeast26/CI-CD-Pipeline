variable "project_id" {
  description = "Google Cloud project ID"
  type        = string
}

variable "region" {
  description = "Region for deployment"
  default     = "us-central1"
}

variable "cloud_run_service_name" {
  description = "Name of the Cloud Run service"
  type        = string
  default     = "my-cloudrun-app"
}

variable "docker_image" {
  description = "Docker image to deploy"
  type        = string
}