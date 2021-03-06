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
variable "sg_description" {}
variable "aws_region" {
  description = "AWS Region selected"
}
variable "sg_admin_id" {}
variable "sg_vpc_id" {}
variable "tag_terraform" {}


###########################
#### Security   Groups and NI####
###########################

variable "database_sg_name" {}
