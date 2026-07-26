data "azurerm_subnet" "subnet" {
    for_each = var.nics
  name                 = each.value.nicsubnetname
  virtual_network_name = each.value.nicvirtual_network_name
  resource_group_name  = each.value.nicresource_group_name
}
data "azurerm_public_ip" "pip" {
  for_each = var.nics
    name                =each.value.nicpipname 
  resource_group_name = each.value.nicresource_group_name
}