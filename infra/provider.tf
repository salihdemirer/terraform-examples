terraform {
  backend "gcs" {
    bucket  = "terraform-demo-app-state-bucket-1"
    prefix  = "terraform/state"
  }
  required_version = "~> 1.3.0"
  required_providers {
    google = {
        source = "hashicorp/google"
        version = "~> 4.24"
    }
  }
}

provider "google" {
    project = var.project
    region = var.region
}

provider "kubernetes" {
  host = "https://${module.kubernetes-engine_private-cluster.endpoint}"
  token = data.google_client_config.default.access_token
  cluster_ca_certificate = base64decode(module.kubernetes-engine_private-cluster.ca_certificate)
}
