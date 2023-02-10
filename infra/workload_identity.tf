module "kubernetes-engine_workload-identity" {
  depends_on = [
    module.kubernetes-engine_private-cluster
  ]
  source = "terraform-google-modules/kubernetes-engine/google//modules/workload-identity"
  version = "25.0.0"
  name = var.svc_acc_name # Name for both service accounts.
  namespace = var.namespace
  project_id = var.project
  roles = ["roles/storage.admin", "roles/compute.admin"]
}
