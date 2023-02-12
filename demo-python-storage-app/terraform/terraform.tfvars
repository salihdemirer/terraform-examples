# Definitions for Google Project
project = "terraform-test-377408"
region  = "us-east1"
zones   = ["us-east1-b", "us-east1-c", "us-east1-d"]

# Definitions for Network
vpc_network_name         = "vpc-network"
routing_mode             = "REGIONAL"
vpc_subnetwork_name      = "vpc-subnetwork"
subnet                   = "10.1.0.0/16"
pod_secondary_range      = "192.168.10.0/24"
svc_secondary_range      = "192.168.9.0/24"
pod_secondary_range_name = "pod-range"
svc_secondary_range_name = "svc-range"
network_router_name      = "vpc-network-router"
network_nat_name         = "vpc-network-nat"

# Definitions for Cluster
cluster_zone           = "us-east1-b"
cluster_name           = "gke-test-cluster"
master_ipv4_cidr_block = "10.0.0.0/28"

# Definitions for Bucket
storage_class            = "REGIONAL"
public_access_prevention = "enforced"

# Definitions for Workload Identity
svc_acc_name = "app-demo-salihdemirer"
namespace    = "default"

# Definitions for Cloud Build
location       = "global" # Cloud Build location
app_repo_name      = "demo-app-salihdemirer"
app_branch_name    = "master"
k8s_repo_name      = "demo-k8s-files-salihdemirer"
k8s_branch_name    = "master"