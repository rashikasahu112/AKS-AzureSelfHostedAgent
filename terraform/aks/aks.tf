resource "azurerm_kubernetes_cluster" "aks" {
  name                = "selfhosted-agent-aks-${var.env}"
  location            =  var.resource_group_location
  resource_group_name =  var.resource_group_name
  dns_prefix          =  "aks-dns"

    default_node_pool {
      name       = "default"
      node_count = 3
      vm_size    = "Standard_B2s"
      enable_auto_scaling = false
    }

    identity {
      type = "SystemAssigned"
    }

    tags = {
    environment : var.env
  }
}

resource "azurerm_role_assignment" "kubweb_to_acr" {
  scope                = var.acr_id
  role_definition_name = "AcrPull"
  principal_id         = azurerm_kubernetes_cluster.aks.kubelet_identity[0].object_id
}


