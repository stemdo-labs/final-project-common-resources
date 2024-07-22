#Common vars
RG_name  = "final-project-common"
location = "UK South"

# Network vars
vnet_name          = "vnet-common-bootcamp"
vnet_address_space = ["10.0.0.0/16"]

# Subnetwork vars
subnets = {
  sn1 = {
    name             = "sn-common-aks-project"
    address_prefixes = ["10.0.25.0/24"]
  }
  sn2 = {
    name             = "sn-palonso"
    address_prefixes = ["10.0.26.0/24"]
  }
  sn3 = {
    name             = "sn-dnazareno"
    address_prefixes = ["10.0.27.0/24"]
  }
  sn4 = {
    name             = "sn-icasado"
    address_prefixes = ["10.0.28.0/24"]
  }
  sn5 = {
    name             = "sn-eperez"
    address_prefixes = ["10.0.29.0/24"]
  }
  sn6 = {
    name             = "sn-plopez"
    address_prefixes = ["10.0.30.0/24"]
  }
  sn7 = {
    name             = "sn-lcabrita"
    address_prefixes = ["10.0.31.0/24"]
  }
  sn8 = {
    name             = "sn-ralonso"
    address_prefixes = ["10.0.32.0/24"]
  }
}

# AKS vars
AKS_name           = "aksbootcampwe01"
kubernetes_version = "1.28.5"
sku_tier           = "Free"

# Agent pool profile ####
agent_pool_name         = "agentpool"
agent_pool_vm_size      = "Standard_B2s"
agent_pool_min_count    = 1
agent_pool_max_count    = 2
agent_pool_os_disk_size = 64
a_zones                 = ["1"]


# app_id = xxxx
# client_secret = xxxx
list_aad_group_ids = ["bd07ef0d-c219-47f3-9ee5-67a9b0f76bf3"]

cluster_user_group_oids = [

  # SP propio del aks
  ["95dcb076-cc08-492b-bd81-a3f9ef507be4", "Azure Kubernetes Service RBAC Cluster Admin"],

  # sabreu 
  ["bd07ef0d-c219-47f3-9ee5-67a9b0f76bf3", "Azure Kubernetes Service RBAC Cluster Admin"],

  # ["bd07ef0d-c219-47f3-9ee5-67a9b0f76bf3", "Azure Kubernetes Service RBAC Cluster Admin"]


]
