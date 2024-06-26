# Terraform

Esta carpeta permite desplegar:
* Un Grupo de recursos
* Una vnet
* Una subnet para el AKS común y una para cada stemdoer
* Un AKS con un nodo

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | 3.102.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | 3.102.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_kubernetes_cluster.aks](https://registry.terraform.io/providers/hashicorp/azurerm/3.102.0/docs/resources/kubernetes_cluster) | resource |
| [azurerm_resource_group.RG](https://registry.terraform.io/providers/hashicorp/azurerm/3.102.0/docs/resources/resource_group) | resource |
| [azurerm_subnet.sn](https://registry.terraform.io/providers/hashicorp/azurerm/3.102.0/docs/resources/subnet) | resource |
| [azurerm_virtual_network.vnet](https://registry.terraform.io/providers/hashicorp/azurerm/3.102.0/docs/resources/virtual_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_AKS_name"></a> [AKS\_name](#input\_AKS\_name) | AKS name | `string` | `"aksbootcampwe01"` | no |
| <a name="input_RG_name"></a> [RG\_name](#input\_RG\_name) | The name of the resource group | `string` | `"RG-Common-Resources-Bootcamp"` | no |
| <a name="input_a_zones"></a> [a\_zones](#input\_a\_zones) | Availability zones (AZs) are isolated locations within data center regions from which public cloud services originate and operat.<br>Changing this forces a new resource to be created. | `list(string)` | <pre>[<br>  "1",<br>  "2",<br>  "3"<br>]</pre> | no |
| <a name="input_agent_pool_max_count"></a> [agent\_pool\_max\_count](#input\_agent\_pool\_max\_count) | Maximum number of agents (VMs) in the pool. Possible values must be in the range of 1 to 100 (inclusive). | `number` | `7` | no |
| <a name="input_agent_pool_max_pods"></a> [agent\_pool\_max\_pods](#input\_agent\_pool\_max\_pods) | The maximum number of pods that can run on each agent. NOTE: If use network plugin 'azure' assign max 30 by default. Because it needs too much IPs. | `number` | `30` | no |
| <a name="input_agent_pool_min_count"></a> [agent\_pool\_min\_count](#input\_agent\_pool\_min\_count) | Minimum number of agents (VMs) in the pool. Possible values must be in the range of 1 to 100 (inclusive). | `number` | `1` | no |
| <a name="input_agent_pool_name"></a> [agent\_pool\_name](#input\_agent\_pool\_name) | Unique name of the Agent Pool Profile in the context of the Subscription and Resource Group. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_agent_pool_os_disk_size"></a> [agent\_pool\_os\_disk\_size](#input\_agent\_pool\_os\_disk\_size) | Size in GB of the agents nodes OS. | `string` | `"64"` | no |
| <a name="input_agent_pool_vm_size"></a> [agent\_pool\_vm\_size](#input\_agent\_pool\_vm\_size) | The size of each VM in the Agent Pool. | `string` | n/a | yes |
| <a name="input_app_id"></a> [app\_id](#input\_app\_id) | The Client ID (appId) for the Service Principal used for the AKS deployment | `string` | n/a | yes |
| <a name="input_client_secret"></a> [client\_secret](#input\_client\_secret) | The Client Secret (password) for the Service Principal used for the AKS deployment | `string` | n/a | yes |
| <a name="input_dns_prefix"></a> [dns\_prefix](#input\_dns\_prefix) | DNS prefix specified when creating the managed cluster. Changing this forces a new resource to be created. Pass trougth workload main.tf.<br>Changing this forces a new resource to be created. | `string` | `"aks-dns"` | no |
| <a name="input_kubernetes_version"></a> [kubernetes\_version](#input\_kubernetes\_version) | Version of Kubernetes specified when creating the AKS managed cluster. | `string` | n/a | yes |
| <a name="input_list_aad_group_ids"></a> [list\_aad\_group\_ids](#input\_list\_aad\_group\_ids) | Object Id of Azure Active Directory Groups which should have Admin Role on the Cluster. | `list(string)` | `[]` | no |
| <a name="input_location"></a> [location](#input\_location) | The location of the resource group | `string` | `"westeurope"` | no |
| <a name="input_sku_tier"></a> [sku\_tier](#input\_sku\_tier) | The SKU Tier that should be used for this Kubernetes Cluster. Possible values are Free, Paid and Standard. | `string` | `"Free"` | no |
| <a name="input_subnets"></a> [subnets](#input\_subnets) | Subnetwork vars | <pre>map(object({<br>    name                 = string<br>    virtual_network_name = string<br>    address_prefixes     = list(string)<br>  }))</pre> | n/a | yes |
| <a name="input_vnet_address_space"></a> [vnet\_address\_space](#input\_vnet\_address\_space) | The address space for the virtual network | `list(string)` | <pre>[<br>  "10.0.0.0/16"<br>]</pre> | no |
| <a name="input_vnet_name"></a> [vnet\_name](#input\_vnet\_name) | The name of the virtual network | `string` | `"example-vnet"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aks_id"></a> [aks\_id](#output\_aks\_id) | The Kubernetes Managed Cluster ID. |
| <a name="output_kube_config_raw"></a> [kube\_config\_raw](#output\_kube\_config\_raw) | Raw Kubernetes config to be used by kubectl and other compatible tools |
| <a name="output_properties"></a> [properties](#output\_properties) | An object with all of the AKS' terraform properties. |
