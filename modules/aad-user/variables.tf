variable "username" {
  type        = string
  description = "Username"
}

variable "group" {
  type        = string
  description = "Group"
}

variable "domain_name" {
  type        = string
  description = "AAD domain name"
}

variable "hub" {
  type        = string
  description = "Hub Subscription Name"
}

variable "spoke1" {
  type        = string
  description = "Spoke 1 Subscription Name"
}

variable "spoke2" {
  type        = string
  description = "Spoke 2 Subscription Name"
}

variable "password" {
  type        = string
  description = "Temporary password"
}

