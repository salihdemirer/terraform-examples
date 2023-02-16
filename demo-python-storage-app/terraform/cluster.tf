data "google_client_config" "default" {}
data "google_compute_default_service_account" "default" {}

module "kubernetes-engine_private-cluster" {
  depends_on = [
    google_compute_subnetwork.us-east1_subnet, google_storage_bucket.app_bucket
  ]
  source                     = "terraform-google-modules/kubernetes-engine/google//modules/private-cluster"
  version                    = "25.0.0"
  project_id                 = var.project
  name                       = var.cluster_name
  region                     = var.region
  zones                      = [var.zones[0]]
  network                    = var.vpc_network_name
  subnetwork                 = var.vpc_subnetwork_name
  ip_range_pods              = var.pod_secondary_range_name
  ip_range_services          = var.svc_secondary_range_name
  http_load_balancing        = false
  horizontal_pod_autoscaling = false
  enable_private_endpoint    = false
  enable_private_nodes       = true
  master_ipv4_cidr_block     = var.master_ipv4_cidr_block
  create_service_account     = false
  service_account            = data.google_compute_default_service_account.default.email
  grant_registry_access      = true

  node_pools = [
    {
      name            = "default-node-pool"
      machine_type    = "e2-small"
      node_locations  = "us-east1-b"
      min_count       = 2
      max_count       = 2
      local_ssd_count = 0
      spot            = true
      disk_size_gb    = 30
      disk_type       = "pd-standard"
      image_type      = "COS_CONTAINERD"
      enable_gcfs     = false
      enable_gvnic    = false
      auto_repair     = true
      auto_upgrade    = true

    },
  ]

  node_pools_oauth_scopes = {
    all = [
      "https://www.googleapis.com/auth/logging.write",
      "https://www.googleapis.com/auth/monitoring",
      # Added extra scopes due to access container registry.
    ]
  }

  node_pools_labels = {
    all = {}

  }
}
