# Access project_number data for service account prefix.
data "google_project" "project" {}

resource "google_project_iam_member" "cloud_build_role" {
  project = var.project
  role = "roles/container.developer"
  member = "serviceAccount:${data.google_project.project.number}@cloudbuild.gserviceaccount.com"
}

resource "google_cloudbuild_trigger" "app_build_trigger"{
  depends_on = [
    google_project_iam_member.cloud_build_role,
    google_storage_bucket.app_bucket
  ]
  location = var.location
    trigger_template {
      branch_name = var.branch_name
      repo_name = var.repo_name
    }
  substitutions = {
    "_FILENAME" = var.k8s_filename
    "_LOCATION" = var.subs_location
    "_CLUSTER" = var.cluster_name
    "_BUCKET_NAME" = google_storage_bucket.app_bucket.name
    "_SA_NAME" = var.svc_acc_name
  }
  filename = var.build_filename
}
