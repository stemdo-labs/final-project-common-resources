#Common vars
RG_name  = "RG-Common-Resources-Bootcamp"
location = "west europe"

# Network vars
vnet_name          = "vnet-common-bootcamp"
vnet_address_space = ["10.0.0.0/16"]

# Subnetwork vars
subnets = {
  sn1 = {
    name             = "sn-common-aks-project"
    address_prefixes = ["10.0.0.0/24"]
  }
  sn2 = {
    name             = "sn-palonso"
    address_prefixes = ["10.0.1.0/24"]
  }
  sn3 = {
    name             = "sn-dnavarro"
    address_prefixes = ["10.0.2.0/24"]
  }
  sn4 = {
    name             = "sn-icasado"
    address_prefixes = ["10.0.3.0/24"]
  }
  sn5 = {
    name             = "sn-eperez"
    address_prefixes = ["10.0.4.0/24"]
  }
  sn6 = {
    name             = "sn-plopez"
    address_prefixes = ["10.0.5.0/24"]
  }
}

# AKS vars
AKS_name           = "aksbootcampwe01"
kubernetes_version = "1.25.6"
sku_tier           = "Free"

# Agent pool profile ####
agent_pool_name         = "agentpool"
agent_pool_vm_size      = "Standard_B2s"
agent_pool_min_count    = 1
agent_pool_max_count    = 2
agent_pool_os_disk_size = 64
a_zones                 = ["1"]


app_id = xxxx
client_secret = xxxx
list_aad_group_ids = ["xxx", "xxx"]
