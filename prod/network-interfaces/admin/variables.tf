# commons variables default

variable "aws_subnet_id" {}

variable "tag_environment" {
  default = "PRD"
}
variable "tag_eotp" {
  default = "10552244-Kaspersky"
}
variable "tag_application" {
  default = "KASPERSKY"
}
variable "tag_owner" {
  default = "z10.watertech.fr.corpit.security-team.all.groups@veolia.com"
}
variable "sg_description" {
  default = "Network interface for admin Kaspersky"
}
variable "tag_terraform" {}
variable "aws_region"{}

# variables for kscp
variable "kscp_ni_name" {
  default = "AMIE79.NI.KSCP.ADM"
}
variable "priv_ip"{
  default= "10.84.36.81"
}
