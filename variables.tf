variable "client" {}
variable "secret" {}
variable "tenant" {}
variable "subscription" {}
variable "userlist" {
  type = map(object({
    username  = string
    group = string
    hub = string
    spoke1 = string
    spoke2 = string 
  }))
}
variable "password" {
  type        = string
  description = "Temporary password"
  default     = "Str0ng3stP@sswd3ver!"
}
