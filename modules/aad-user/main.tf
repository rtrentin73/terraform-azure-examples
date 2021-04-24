resource "azuread_user" "user" {
  user_principal_name   = "${var.username}@${var.domain_name}"
  display_name          = var.username
  mail_nickname         = var.username
  password              = var.password
  force_password_change = false
}

data "azuread_group" "group" {
  display_name     = var.group
  security_enabled = true
}

resource "azuread_group_member" "member" {
  group_object_id  = data.azuread_group.group.id
  member_object_id = azuread_user.user.id
}

data "azurerm_subscription" "subscriptionhub" {
  subscription_id = var.hub 
}

data "azurerm_subscription" "subscriptionspoke1" {
  subscription_id = var.spoke1
}

data "azurerm_subscription" "subscriptionspoke2" {
  subscription_id = var.spoke2
}

resource "azurerm_role_assignment" "role" {
  for_each = {
   hub = data.azurerm_subscription.subscriptionhub.id 
   spoke1= data.azurerm_subscription.subscriptionspoke1.id 
   spoke2 = data.azurerm_subscription.subscriptionspoke2.id 
  }
  scope                = each.value
  role_definition_name = "Owner"
  principal_id         = data.azuread_group.group.id 
}