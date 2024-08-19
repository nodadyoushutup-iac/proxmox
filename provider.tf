# infrastructure/proxmox/provider./tf

terraform {
  required_providers {
    proxmox = {
      source = "bpg/proxmox"
    }
    spacelift = {
      source  = "spacelift-io/spacelift"
      version = ">= 0.2.0"
    }
  }
}

provider "proxmox" {
  endpoint = local.provider.proxmox.endpoint
  api_token = local.provider.proxmox.api_token
  insecure  = local.provider.proxmox.insecure
  ssh {
    agent = true
    agent_socket = 22
    username = local.provider.proxmox.username
    private_key = file("/mnt/workspace/proxmox.pem")
    node {
      name = local.provider.proxmox.node.name
      address = local.provider.proxmox.node.address
    }
  }
}

provider "spacelift" {}