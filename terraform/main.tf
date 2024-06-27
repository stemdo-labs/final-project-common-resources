terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.102.0"
    }
  }


   backend "azurerm" {
    resource_group_name  = "final-project-common-resources"
    storage_account_name = "finalcommonresources"
    container_name       = "finalcommonresourcescont"
    key                  = "tfstateaks"
  } 
}

provider "azurerm" {
  skip_provider_registration = true
  features {}
}

resource "azurerm_resource_group" "RG" {
  name     = var.RG_name
  location = var.location
}

resource "azurerm_virtual_network" "vnet" {
  depends_on = [azurerm_resource_group.RG]

  name                = var.vnet_name
  location            = var.location
  resource_group_name = var.RG_name
  address_space       = var.vnet_address_space
}

resource "azurerm_subnet" "sn" {
  depends_on = [azurerm_virtual_network.vnet]
  for_each   = var.subnets

  name                 = each.value.name
  resource_group_name  = var.RG_name
  virtual_network_name = azurerm_virtual_network.vnet.name
  address_prefixes     = each.value.address_prefixes

}


#AKS
resource "azurerm_kubernetes_cluster" "aks" {
  depends_on = [azurerm_subnet.sn]

  name                              = var.AKS_name
  location                          = var.location
  resource_group_name               = var.RG_name
  kubernetes_version                = var.kubernetes_version
  dns_prefix                        = var.dns_prefix
  sku_tier                          = var.sku_tier
  role_based_access_control_enabled = true

  default_node_pool {
    name                 = var.agent_pool_name
    vm_size              = var.agent_pool_vm_size
    enable_auto_scaling  = true
    min_count            = var.agent_pool_min_count
    max_count            = var.agent_pool_max_count
    node_count           = var.agent_pool_min_count
    type                 = "VirtualMachineScaleSets"
    max_pods             = var.agent_pool_max_pods
    os_disk_size_gb      = var.agent_pool_os_disk_size
    vnet_subnet_id       = azurerm_subnet.sn["sn1"].id
    zones                = var.a_zones
    orchestrator_version = var.kubernetes_version

  }

  service_principal {
    client_id     = var.app_id
    client_secret = var.client_secret
  }

  azure_active_directory_role_based_access_control {
    managed = true
    admin_group_object_ids = var.list_aad_group_ids
    azure_rbac_enabled = true
  }

  identity {
    type = "SystemAssigned"
  }

}


 resource "azurerm_role_assignment" "aks_cluster_users" {
  count               = length(var.cluster_user_group_oids)
  scope               = azurerm_kubernetes_cluster.aks.id
  role_definition_name = var.cluster_user_group_oids[count.index][1]
  principal_id        = var.cluster_user_group_oids[count.index][0]
   timeouts {
    create = "10m"
  }
}