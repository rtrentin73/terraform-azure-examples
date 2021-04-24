variable "client" {}
variable "secret" {}
variable "tenant" {}
variable "subscription" {}
variable "userlist" {
  type = map(object({
    username  = string
    group = string
  }))
}
variable "password" {
  type        = string
  description = "Temporary password"
  default     = "Str0ng3stP@sswd3ver!"
}
