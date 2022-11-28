resource "google_vertex_ai_featurestore" "featurestore" {
  name     = "${var.featurestore_id}"
  labels   = "${var.labels}"
  region   = "${var.location}"
  online_serving_config {
    fixed_node_count = var.online_serving_fixed_node_count
  }
  #encryption_spec {
    #kms_key_name = "kms-name"
  #}
}

resource "google_vertex_ai_featurestore_entitytype" "entity" {
  name     = "${var.entitytype_id}"
  labels   = "${var.labels}"
  featurestore = google_vertex_ai_featurestore.featurestore.id
  #monitoring_config {
    #snapshot_analysis {
      #disabled = false
      #monitoring_interval_days = 1
      #staleness_days = 21
    #}
    #numerical_threshold_config {
      #value = 0.8
    #}
    #categorical_threshold_config {
      #value = 10.0
    #}
    #import_features_analysis {
      #state = "ENABLED"
      #anomaly_detection_baseline = "PREVIOUS_IMPORT_FEATURES_STATS"
    #}
  #}
}

resource "google_vertex_ai_featurestore_entitytype_feature" "text_feature" {
  name     = "text"
  entitytype = google_vertex_ai_featurestore_entitytype.entity.id
  value_type = "STRING"
  description = "The content of the sms"
}

resource "google_vertex_ai_featurestore_entitytype_feature" "label_feature" {
  name     = "label"
  entitytype = google_vertex_ai_featurestore_entitytype.entity.id
  value_type = "INT64"
  description = "The label of ths sms content: 0 (safe) or 1 (scam)"
}
