
# locals --> initialize the local variables to be used with the terragrunt.hcl file 
locals {
  # Automatically load environment-level variables
  project_vars = read_terragrunt_config(find_in_parent_folders("project.hcl"))
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))
  environment_vars = read_terragrunt_config(find_in_parent_folders("env.hcl"))

  project_id = local.project_vars.locals.project_id
  region     = local.region_vars.locals.region
}


# Define the location for the root tf-module 
terraform {
  source = "../../../..//modules/fbi-sms"
}


# for the backend state prefix 
# generated-prefix-path in the gcs bucket: /env/prod/global/gcs/default.tfstate 
include {
  path = find_in_parent_folders()
}

# Inputs to our root module(terraform.tfvar content) with interpolation if needed.
# Pass the variables values to the root modules
inputs = {
  featurestore_id = "fbi_sms"
  labels = {
    "mlops": "fbi_sms"
  }
  location = local.region
  entitytype_id = "sms"
  online_serving_fixed_node_count = 0
}
