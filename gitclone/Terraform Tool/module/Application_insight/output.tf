output "instrumentation_key" {
  value         = azurerm_application_insights.application-insights[*].instrumentation_key
}

output "connection_string" {
  value         = azurerm_application_insights.application-insights[*].connection_string
}