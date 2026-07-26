module "resource_group" {
  source = "../../child module/azurerm_resource_group"
  rgs    = var.rgnames
}
module "virtual_network" {
  depends_on = [module.resource_group]
  source     = "../../child module/azurerm_virtual_network"
  vnets      = var.vnet
}
module "subnet" {
  depends_on = [module.resource_group, module.virtual_network]
  source     = "../../child module/azurerm_subnet"
  subnets    = var.subnet
}
module "public_ip" {
  depends_on = [module.resource_group, module.virtual_network,module.subnet]
  source     = "../../child module/azurerm_public_ip"
  publicip   = var.pip
}
module "nic" {
  depends_on = [module.resource_group, module.virtual_network,module.subnet,module.public_ip]
  source     = "../../child module/azurerm_network_interface_card"
  nics        = var.nic
}
module "linuxvm" {
  depends_on = [module.resource_group, module.virtual_network, module.subnet,module.public_ip,module.nic]
  source     = "../../child module/azurerm_virtual_machine"
  vm         = var.vms

}