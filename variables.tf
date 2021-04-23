variable "client" {}
variable "secret" {}
variable "tenant" {}
variable "subscription" {}
variable "userlist" {
  type    = list(string)
  default = ["aciuser01", "aciuser02" , "aciuser03", "aciuser04", "aciuser05", "aciuser06", "aciuser07", "aciuser08", "aciuser09", "aciuser10"]
}

variable "password" {
  type        = string
  description = "Temporary password"
  default     = "Str0ng3stP@sswd3ver!"
}
