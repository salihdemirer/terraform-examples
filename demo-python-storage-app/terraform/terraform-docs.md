terraform-docs markdown table --output-file terraform-docs.md --output-mode inject $pwd

<!-- BEGIN_TF_DOCS -->
## Requirements
 
| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.3.0 |
| <a name="requirement_google"></a> [google](#requirement\_google) | ~> 4.24 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.52.0 |
| <a name="provider_random"></a> [random](#provider\_random) | 3.4.3 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_kubernetes-engine_private-cluster"></a> [kubernetes-engine\_private-cluster](#module\_kubernetes-engine\_private-cluster) | terraform-google-modules/kubernetes-engine/google//modules/private-cluster | 25.0.0 |
| <a name="module_kubernetes-engine_workload-identity"></a> [kubernetes-engine\_workload-identity](#module\_kubernetes-engine\_workload-identity) | terraform-google-modules/kubernetes-engine/google//modules/workload-identity | 25.0.0 |

## Resources

| Name | Type |
|------|------|
| [google_cloudbuild_trigger.app_build_trigger](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/cloudbuild_trigger) | resource |
| [google_compute_firewall.vpc_internal_allow](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_firewall) | resource |
| [google_compute_network.vpc_network](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_network) | resource |
| [google_compute_router.vpc_network_router](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router) | resource |
| [google_compute_router_nat.vpc_network_nat](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_router_nat) | resource |
| [google_compute_subnetwork.us-east1_subnet](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/compute_subnetwork) | resource |
| [google_project_iam_member.cloud_build_role](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/project_iam_member) | resource |
| [google_storage_bucket.app_bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |
| [random_id.bucket_id](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/id) | resource |
| [google_client_config.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/client_config) | data source |
| [google_compute_default_service_account.default](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/compute_default_service_account) | data source |
| [google_project.project](https://registry.terraform.io/providers/hashicorp/google/latest/docs/data-sources/project) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_branch_name"></a> [branch\_name](#input\_branch\_name) | n/a | `string` | n/a | yes |
| <a name="input_build_filename"></a> [build\_filename](#input\_build\_filename) | n/a | `string` | n/a | yes |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | n/a | `string` | n/a | yes |
| <a name="input_cluster_zone"></a> [cluster\_zone](#input\_cluster\_zone) | Cluster variables | `string` | n/a | yes |
| <a name="input_k8s_filename"></a> [k8s\_filename](#input\_k8s\_filename) | n/a | `string` | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | Cloud-build | `string` | n/a | yes |
| <a name="input_master_ipv4_cidr_block"></a> [master\_ipv4\_cidr\_block](#input\_master\_ipv4\_cidr\_block) | n/a | `string` | n/a | yes |
| <a name="input_namespace"></a> [namespace](#input\_namespace) | n/a | `string` | n/a | yes |
| <a name="input_network_nat_name"></a> [network\_nat\_name](#input\_network\_nat\_name) | n/a | `string` | n/a | yes |
| <a name="input_network_router_name"></a> [network\_router\_name](#input\_network\_router\_name) | n/a | `string` | n/a | yes |
| <a name="input_pod_secondary_range"></a> [pod\_secondary\_range](#input\_pod\_secondary\_range) | n/a | `string` | n/a | yes |
| <a name="input_pod_secondary_range_name"></a> [pod\_secondary\_range\_name](#input\_pod\_secondary\_range\_name) | n/a | `string` | n/a | yes |
| <a name="input_project"></a> [project](#input\_project) | Project variables | `string` | n/a | yes |
| <a name="input_public_access_prevention"></a> [public\_access\_prevention](#input\_public\_access\_prevention) | n/a | `string` | n/a | yes |
| <a name="input_region"></a> [region](#input\_region) | n/a | `string` | n/a | yes |
| <a name="input_repo_name"></a> [repo\_name](#input\_repo\_name) | n/a | `string` | n/a | yes |
| <a name="input_routing_mode"></a> [routing\_mode](#input\_routing\_mode) | n/a | `string` | n/a | yes |
| <a name="input_storage_class"></a> [storage\_class](#input\_storage\_class) | Bucket variables | `string` | n/a | yes |
| <a name="input_subnet"></a> [subnet](#input\_subnet) | n/a | `string` | n/a | yes |
| <a name="input_subs_location"></a> [subs\_location](#input\_subs\_location) | n/a | `string` | n/a | yes |
| <a name="input_svc_acc_name"></a> [svc\_acc\_name](#input\_svc\_acc\_name) | Workload Identity variables | `string` | n/a | yes |
| <a name="input_svc_secondary_range"></a> [svc\_secondary\_range](#input\_svc\_secondary\_range) | n/a | `string` | n/a | yes |
| <a name="input_svc_secondary_range_name"></a> [svc\_secondary\_range\_name](#input\_svc\_secondary\_range\_name) | n/a | `string` | n/a | yes |
| <a name="input_vpc_network_name"></a> [vpc\_network\_name](#input\_vpc\_network\_name) | Network variables | `string` | n/a | yes |
| <a name="input_vpc_subnetwork_name"></a> [vpc\_subnetwork\_name](#input\_vpc\_subnetwork\_name) | n/a | `string` | n/a | yes |
| <a name="input_zones"></a> [zones](#input\_zones) | n/a | `list(string)` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->