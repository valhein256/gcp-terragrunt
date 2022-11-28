resource "google_storage_bucket" "mlops-builds" {
  name          = "${var.bucket_name}"
  location      = "${var.location}"
  force_destroy = "${var.enable_force_destroy}"

  uniform_bucket_level_access = "${var.enable_uniform_bucket_level_access}"
}
