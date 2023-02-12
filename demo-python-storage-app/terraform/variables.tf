# Project variables
variable "project" { type = string }
variable "region" { type = string }
variable "zones" { type = list(string) }


# Network variables
variable "vpc_network_name" { type = string }
variable "routing_mode" { type = string }
variable "vpc_subnetwork_name" { type = string }
variable "subnet" { type = string }
variable "pod_secondary_range" { type = string }
variable "svc_secondary_range" { type = string }
variable "pod_secondary_range_name" { type = string }
variable "svc_secondary_range_name" { type = string }
variable "network_router_name" { type = string }
variable "network_nat_name" { type = string }

# Cluster variables
variable "cluster_zone" { type = string }
variable "cluster_name" { type = string }
variable "master_ipv4_cidr_block" { type = string }

# Bucket variables
variable "storage_class" { type = string }
variable "public_access_prevention" { type = string }

# Workload Identity variables
variable "svc_acc_name" { type = string }
variable "namespace" { type = string }

#Cloud-build
variable "location" { type = string }
variable "app_repo_name" { type = string }
variable "app_branch_name" { type = string }
variable "k8s_repo_name" { type = string }
variable "k8s_branch_name" { type = string }