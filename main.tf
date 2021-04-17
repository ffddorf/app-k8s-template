terraform {
  backend "remote" {
    organization = "ffddorf"

    workspaces {
      prefix = "app-k8s-template-"
    }
  }
}
