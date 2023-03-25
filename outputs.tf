output "azurerm_lb_backend_address_pool_id" {
  description = "the id for the azurerm_lb_backend_address_pool resource"
  value       = module.lb_wrapper.azurerm_lb_backend_address_pool_id
}
