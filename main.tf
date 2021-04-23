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
# read subscriptions
#
#data "azurerm_subscriptions" "subscriptions" {
#}
#
# read groups
#
#data "azuread_groups" "groups" {
#  display_names = ["cxttgcloudaci01", "cxttgcloudaci02", "cxttgcloudaci03", "cxttgcloudaci04", "cxttgcloudaci05", "cxttgcloudaci06", "cxttgcloudaci07", "cxttgcloudaci08", "cxttgcloudaci09", "cxttgcloudaci10"]
#}
#
# create users 
#
module "aad-user" {
  source      = "./modules/aad-user"
  for_each    = toset(var.userlist)
  username    = each.value
  password    = var.password
  domain_name = data.azuread_domains.aad_domains.domains[0].domain_name
}
#
# add to group
#