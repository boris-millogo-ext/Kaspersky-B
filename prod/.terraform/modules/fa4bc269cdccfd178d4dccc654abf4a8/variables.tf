# commons variables default
variable "tag_environment" {
  default = "PRD"
}
variable "tag_eotp" {
  default = "10552244-Kasperksy"
}
variable "tag_application" {
  default = "KASPERSKY"
}
variable "tag_owner" {
  default = "z10.watertech.fr.corpit.security-team.all.groups@veolia.com"
}
variable "sg_description" {
  default = "Security group for Kaspersky Admin Console"
}
variable "aws_region" {
  description = "AWS Region selected"
}
variable "tag_terraform" {}


###########################
#### Security   Groups and NI ####
###########################
# variables for kscp
variable "kscp_ni_name" {
  default = "AMIE79.NI.KSCP.ADM"
}
variable "admin_sg_name" {}
variable "sg_vpc_id" {}