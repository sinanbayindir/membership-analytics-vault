# Configure Terraform with required providers
terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "~> 5.24.0" # Allow for compatible future versions
    }
  }
}

# Define Google Cloud provider with credentials and project details
provider "google" {
  credentials = file(var.credentials) # Use clearer name
  project     = var.project_id
  region      = var.region
}

# Resource for Google Cloud Storage Bucket with lifecycle management
resource "google_storage_bucket" "membership_analytics_vault" {
  name          = var.bucket_name
  location      = var.region
  storage_class = var.bucket_storage_class
  force_destroy = true

  lifecycle_rule {
    condition {
      age = 1 # Days to keep objects before deletion
    }
    action {
      type = "Delete"
    }
  }
}

# Resource for Google BigQuery dataset
resource "google_bigquery_dataset" "membership_analytics_vault" {
  dataset_id = var.dataset_id
  location   = var.region
}