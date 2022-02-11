data "google_iam_policy" "authsa" {
  binding {
    role = "roles/run.invoker"
    members = ["serviceAccount:${google_service_account.pusher_account.email}"]
  }
}

resource "google_cloud_run_service_iam_policy" "authsa" {
  location    = google_cloud_run_service.sub.location
  project     = google_cloud_run_service.sub.project
  service     = google_cloud_run_service.sub.name

  policy_data = data.google_iam_policy.authsa.policy_data
}