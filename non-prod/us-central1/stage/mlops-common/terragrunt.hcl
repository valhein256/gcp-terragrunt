
# locals --> initialize the local variables to be used with the terragrunt.hcl file 
locals {
  # Automatically load environment-level variables
  project_id = read_terragrunt_config(find_in_parent_folders("project.hcl")).locals.project_id
}

# Define the location for the root tf-module 
terraform {
  source = "../../../..//modules/mlop-common"
}


# for the backend state prefix 
# generated-prefix-path in the gcs bucket: /env/prod/global/gcs/default.tfstate 
include {
  path = find_in_parent_folders()
}

# Inputs to our root module(terraform.tfvar content) with interpolation if needed.
# Pass the variables values to the root modules
inputs = {
  bucket_name = "mlops-builds-stg"
  location   = "us-central1"
}
