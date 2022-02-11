resource "google_monitoring_uptime_check_config" "check_service" {
  display_name = "check-run"
  timeout = "30s"

  http_check {
    path           = "health"
    port           = 443
    request_method = "GET"
    use_ssl        = true
    validate_ssl   = true
  }

  monitored_resource {
    labels = {
      host = replace(google_cloud_run_service.sub.status[0].url, "https://", "")
    }
    type   = "uptime_url"
  }
}