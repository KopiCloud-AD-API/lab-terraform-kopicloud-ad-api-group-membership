##############################################
## Kopicloud Terraform Provider - Variables ##
##############################################

variable "kopicloud_token" {
  type        = string
  description = "KopiCloud AD API Token"
}

variable "kopicloud_host" {
  type        = string
  description = "KopiCloud AD API Host"
}

variable "ou_path" {
  type        = string
  description = "OU for computers"
  default     = ""
}
