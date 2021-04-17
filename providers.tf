data "terraform_remote_state" "kubernetes" {
  backend = "remote"

  config = {
    organization = "ffddorf"
    workspaces = {
      name = "k3os-on-proxmox"
    }
  }
}

locals {
  kubernetes_host = "${data.terraform_remote_state.kubernetes.outputs.dns_records[0].name}.freifunk-duesseldorf.de"
}

provider "kubernetes" {
  host  = "https://${local.kubernetes_host}:8443"
  token = data.terraform_remote_state.kubernetes.outputs.k8s_api_token
}
