variable "name" {
  type = string
  default = "podx-vm-01"
}

variable "env" {
  type = string
  default = "SRE-LAB"
}

variable "owner" {
  type = string
  default = "PODX"
}

variable "key_pair_name" {
  type = string
  default = "sre_podx_key"
}
