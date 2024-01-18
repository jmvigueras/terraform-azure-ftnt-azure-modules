
output "outputs" {
  description = "Deployment outputs"
  value = azurerm_managed_application.fgt_vhub_nva.outputs
}
output "parameters" {
  description = "Deployment parameters"
  value = azurerm_managed_application.fgt_vhub_nva.parameter_values
}