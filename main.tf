#
# Add users to Azure AD and to pre-existing groups
#
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
}
#
# Configure the Microsoft Azure Provider
#
provider "azurerm" {
  features {}
  subscription_id = var.subscription
  client_id       = var.client
  client_secret   = var.secret
  tenant_id       = var.tenant
}
#
# Configure the Microsoft Azure AD Provider
#
provider "azuread" {
  client_id     = var.client
  client_secret = var.secret
  tenant_id     = var.tenant
}
#
# read domains
#
data "azuread_domains" "aad_domains" {
  only_default = true
}
#
# create users 
#
module "aad-user" {
  source      = "./modules/aad-user"
  for_each    = var.userlist
  username    = each.value.username
  group =       each.value.group
  password    = var.password
  hub = each.value.hub 
  spoke1 = each.value.spoke1
  spoke2 = each.value.spoke2 
  domain_name = data.azuread_domains.aad_domains.domains[0].domain_name
}