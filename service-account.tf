resource "google_service_account" "pusher_account" {
  account_id    = "pub-sub-pusher"
  display_name  = "PubSub Pusher"
  description   = "This account authenticates the pusher in the Cloud Run Service"
}