terraform {
  backend "gcs" {
    bucket = "overmind88-terraform-state"
    prefix = "terraform/prod"
  }
}
