# commons variables default

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
  default = "Network interface for db Kaspersky"
}
variable "tag_terraform" {
  default = "Yes"
}
variable "aws_region"{}

# variables for kscp
variable "kscp_ni_name" {}
# variables for kscp_uat
variable "kscp_uat_ni_name" {
  default = "AMIE79.NI.KSCP.UIV"
}
variable "priv_ip"{type = "list"}
variable "secur_groups"{}
variable "aws_subnet_id" {}
