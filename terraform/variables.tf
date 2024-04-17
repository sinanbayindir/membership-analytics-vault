variable "credentials" {
  description = "GCP Service account JSON credentials"
  default     = "../credentials/membership-analytics-vault-647b9de8c136.json"
}

variable "project_id" {
  description = "Google Cloud Project ID"
}

variable "region" {
  description = "Google Cloud region"
}

variable "bucket_name" {
  description = "Name of the Google Cloud Storage bucket"
}

variable "bucket_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}

variable "dataset_id" {
  description = "BigQuery Dataset ID"
}

variable "table_id" {
  description = "BigQuery Table ID"
}