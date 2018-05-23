# commons variables default

variable "tag_environment" {
  default = "PRD"
}
variable "tag_eotp" {
  default = "10552244-Kaspersky "
}
variable "tag_application" {
  default = "KASPERSKY"
}
variable "tag_owner" {
  default = "z10.watertech.fr.corpit.security-team.all.groups@veolia.com"
}
variable "sg_description" {
  default = "Network interface for Kaspersky"
}
variable "tag_terraform" {
  default = "Yes"
}
variable "aws_region"{}

# variables for Kaspersky
variable "kscp_puba_ni_name"{type = "list"}
variable "kscp_pubb_ni_name"{type = "list"}
variable "secur_groups"{}
variable "aws_puba_subnet_id" {}
variable "aws_pubb_subnet_id" {}
variable "gwpuba_priv_ips"{type = "list"}
variable "gwpubb_priv_ips"{type = "list"}

