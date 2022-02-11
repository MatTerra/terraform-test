resource "google_cloud_run_service" "sub" {
  name     = "consumer"
  location = "us-central1"

  template {
    spec {
      containers {
        image = "gcr.io/mateus-anthor-test/cloudrunsub"
      }
    }
    metadata {
      name = "consumer-v1" # This can be used as revision name in the traffic section
    }
  }

  traffic {
    percent         = 100
    revision_name   = "consumer-v1"
  }
}