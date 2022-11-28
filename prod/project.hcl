# Set project-wide variables. These are automatically pulled in to configure the remote state bucket in the root
# terragrunt.hcl configuration.
locals {
  project_name = "prod"
  project_id   = "trend-micro-check-prod" # TODO: replace me with your project ID!
  profile      = "prod"
}

