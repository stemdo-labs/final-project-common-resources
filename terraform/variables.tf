#Common vars
variable "RG_name" {
  type        = string
  nullable    = false
  default     = "RG-Common-Resources-Bootcamp"
  description = "The name of the resource group"
}

variable "location" {
  type        = string
  default     = "westeurope"
  description = "The location of the resource group"
}

# Network vars
variable "vnet_name" {
  description = "The name of the virtual network"
  type        = string
  default     = "example-vnet"
}

variable "vnet_address_space" {
  description = "The address space for the virtual network"
  type        = list(string)
  default     = ["10.0.0.0/16"]
}

# Subnetwork vars
variable "subnets" {
  type = map(object({
    name                 = string
    # virtual_network_name = string
    address_prefixes     = list(string)
  }))
}

# AKS vars
variable "AKS_name" {
  type        = string
  description = "AKS name"
  default     = "aksbootcampwe01"
}

variable "kubernetes_version" {
  type        = string
  description = "Version of Kubernetes specified when creating the AKS managed cluster."
}

variable "dns_prefix" {
  type        = string
  description = "DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created. Pass trougth workload main.tf.\nChanging this forces a new resource to be created."
  default     = "aks-dns"
}

variable "sku_tier" {
  type        = string
  description = "The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free, Paid and Standard."
  default     = "Free"
}


# Agent pool profile

variable "agent_pool_name" {
  type        = string
  description = "Unique name of the Agent Pool Profile in the context of the Subscription and Resource Group. Changing this forces a new resource to be created."
}

variable "agent_pool_vm_size" {
  type        = string
  description = "The size of each VM in the Agent Pool."
}

variable "agent_pool_min_count" {
  type        = number
  description = "Minimum number of agents (VMs) in the pool. Possible values must be in the range of 1 to 100 (inclusive)."
  default     = 1
}

variable "agent_pool_max_count" {
  type        = number
  description = "Maximum number of agents (VMs) in the pool. Possible values must be in the range of 1 to 100 (inclusive)."
  default     = 7
}

variable "agent_pool_max_pods" {
  type        = number
  description = "The maximum number of pods that can run on each agent. NOTE: If use network plugin 'azure' assign max 30 by default. Because it needs too much IPs."
  default     = 30
}


variable "agent_pool_os_disk_size" {
  description = "Size in GB of the agents nodes OS."
  default     = "64"
}

variable "a_zones" {
  type        = list(string)
  default     = ["1", "2", "3"]
  description = "Availability zones (AZs) are isolated locations within data center regions from which public cloud services originate and operat.\nChanging this forces a new resource to be created."
}

variable "app_id" {
  type        = string
  description = "The Client ID (appId) for the Service Principal used for the AKS deployment"
}

variable "client_secret" {
  type        = string
  description = "The Client Secret (password) for the Service Principal used for the AKS deployment"
}


variable "list_aad_group_ids" {
  type        = list(string)
  description = "Object Id of Azure Active Directory Groups which should have Admin Role on the Cluster."
  default     = []
}

variable "cluster_user_group_oids" {
  type    = list(list(string))
  default = [[]]
  description = "The group ObjectId and the name of the role that you want to assign"
}