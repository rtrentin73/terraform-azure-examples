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

