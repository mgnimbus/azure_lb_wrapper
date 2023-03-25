module "mylb" {
  source              = "Azure/loadbalancer/azurerm"
  resource_group_name = azurerm_resource_group.example.name
  prefix              = "tf-testLBMod"

  remote_port = {
    ssh = ["Tcp", "22"]
  }

  lb_port = {
    http = ["80", "Tcp", "80"]
  }

  lb_probe = {
    http = ["Tcp", "80", ""]
  }

}

resource "azurerm_network_interface_backend_address_pool_association" "web_nic_lb_associate" {
  network_interface_id    = azurerm_network_interface.example.id
  ip_configuration_name   = azurerm_network_interface.example.ip_configuration[0].name
  backend_address_pool_id = module.mylb.azurerm_lb_backend_address_pool_id
}
