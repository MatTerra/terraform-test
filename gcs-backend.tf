terraform {
  backend "gcs" {
    bucket  = "tf-state-anthor-mateus-test"
    prefix  = "terraform/state"
  }
}

data "terraform_remote_state" "test" {
  backend = "gcs"
  config = {
    bucket  = "tf-state-anthor-mateus-test"
    prefix  = "terraform/state"
  }
}
