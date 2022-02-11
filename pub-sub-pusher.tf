resource "google_pubsub_topic" "test-topic" {
  name  = "test-topic"
}

resource "google_pubsub_subscription" "test-subscription" {
  name  = "test-sub"
  topic = google_pubsub_topic.test-topic.name

  push_config {
    push_endpoint = "${google_cloud_run_service.sub.status[0].url}/"

    oidc_token {
      service_account_email  = google_service_account.pusher_account.email
    }

    attributes = {
      x-goog-version = "v1"
    }
  }
}


