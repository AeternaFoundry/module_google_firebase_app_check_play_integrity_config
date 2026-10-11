resource "google_firebase_app_check_play_integrity_config" "firebase_app_check_play_integrity_configs" {
  for_each = var.firebase_app_check_play_integrity_configs

  app_id    = each.value.app_id
  project   = each.value.project
  token_ttl = each.value.token_ttl

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
      delete = timeouts.value.delete
      update = timeouts.value.update
    }
  }
}

