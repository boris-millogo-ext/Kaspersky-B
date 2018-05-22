# commons variables default

variable "aws_subnet_id" {
  default = "subnet-a71d16fc"
}

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
variable "gw_priv_ips" {
	type = "list"
	default = ["10.84.38.193", "10.84.38.194","10.84.38.195","10.84.38.196"]
}
variable "ni_count" {
  default = 4
}
variable "aws_region"{}

# variables for Kaspersky
variable "kscp_ni_name" {
  default = "AMIE79.NI.KSCP.GW"
}
