# Access project_number data for service account prefix.
data "google_project" "project" {}

resource "google_project_iam_member" "cloud_build_role" {
  project = var.project
  role    = "roles/container.developer"
  member  = "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
}

resource "google_cloudbuild_trigger" "app_build_trigger" {
  depends_on = [
    google_project_iam_member.cloud_build_role,
    google_storage_bucket.app_bucket
  ]
  location = var.location # Location for Cloud Builder
  trigger_template {
    branch_name = var.app_branch_name
    repo_name   = var.app_repo_name
  }
  filename = "cloudbuild.yaml"
}

resource "google_cloudbuild_trigger" "k8s_files_trigger" {
  depends_on = [
    google_cloudbuild_trigger.app_build_trigger
  ]
  location = var.location # Location for Cloud Builder
  trigger_template {
    branch_name = var.k8s_branch_name
    repo_name   = var.k8s_repo_name
  }
  substitutions = {
    "_LOCATION" = var.region       # Location for K8S Cluster
    "_CLUSTER"  = var.cluster_name # K8S Cluster Name
  }
  filename = "cloudbuild.yaml"
}
