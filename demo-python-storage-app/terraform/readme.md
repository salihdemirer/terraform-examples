<h3>Steps</h3>
<h4>1 - Check for required API Services below:</h4>
<ul>
 <li>Compute Engine API</li>
 <li>Kubernetes Engine API</li>
 <li>Cloud Resource Manager API</li>
 <li>Cloud Build API</li>
</ul>

<h4>2 - Create two source code repo for the purposes below:</h4>
<ul>
 <li>Docker app image repo</li>
 <li>Kubernetes files repo</li>
</ul>

<h4>3 - Edit terraform.tfvars file</h4>

<h4>4 - Create a bucket for terraform backend and edit the bucket line in provider.tf</h4>

<h4>5 - Deploy Infra</h4>
<ul>
 <li>terraform init</li>
 <li>terraform plan</li>
 <li>terraform apply</li>
</ul>

After these steps the user can push the codes to the desired repos.

<h4>6 - Destroy Infra</h4>
<ul>
 <li>terraform destroy (Put force_destroy to destroy the bucket.)</li>
</ul>
