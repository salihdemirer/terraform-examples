<h3>Steps<h3>
<h4>1 - Check for required API Services below:<h4>
 - Compute Engine API
 - Kubernetes Engine API
 - Cloud Resource Manager API
 - Cloud Build API

<h4>2 - Create two source code repo for the purposes below:<h2>
 - Docker app image repo
 - Kubernetes files repo

<h4>Edit terraform.tfvars file<h4>

<h4>Deploy Infra<h4>
- terraform init
- terraform plan
- terraform apply

After these steps the user can push the codes to the desired repos.

<h5>Destroy Infra<h5>
- terraform destroy (Put force_destroy to destroy the bucket.)
