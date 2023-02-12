<h3>Steps</h3>
<h4>1 - Check for required API Services below:</h4>
<ul>
 <li>Compute Engine API</li>
 <li>Kubernetes Engine API</li>
 <li>Cloud Resource Manager API</li>
 <li>Cloud Build API</li>
</ul>

<h4>2 - Create two source code repo for the purposes below:</h4>
 - Docker app image repo
 - Kubernetes files repo

<h4>3 - Edit terraform.tfvars file</h4>

<h4>4 - Deploy Infra</h4>
- terraform init
- terraform plan
- terraform apply

After these steps the user can push the codes to the desired repos.

<h4>5 - Destroy Infra</h4>
- terraform destroy (Put force_destroy to destroy the bucket.)
