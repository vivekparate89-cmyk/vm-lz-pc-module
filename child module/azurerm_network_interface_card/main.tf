resource "azurerm_network_interface" "nic" {
  for_each = var.nics
  name                = each.value.nicname
  location            = each.value.niclocation
  resource_group_name = each.value.nicresource_group_name

  ip_configuration {
  name                          = "publicip"
  subnet_id                     = data.azurerm_subnet.subnet[each.key].id
  public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
  private_ip_address_allocation = "Dynamic"
  
  }
}

