# commons variables default

variable "tag_environment" {
  description = "Name of the environment"
}

variable "tag_eotp" {
  description = "Name of the EOTP"
}

variable "tag_application" {
  description = "Name of the application"
}

variable "tag_owner" {
  description = "Name of the owner of the project"
}

variable "tag_terraform" {
  description = "If the project is terraformed"
}

variable "tag_snapshot" {
  description = "Snapshot of instances: TRUE or FALSE"
}

variable "instance_monitoring" {
  description = "detailed monitoring enabled"
}

variable "root_volume_type" {
  description = "Type of root volume default"
}

variable "aws_keyname" {
  description = "Keypair for admin instance for the project"
}

# commons variables for kaspk_admin_prod

variable "kaspk_admin_tag_name" {}
variable "kaspk_admin_instance_type" {}
variable "kaspk_admin_root_size" {}
variable "kaspk_admin_tag_comments" {}
variable "kaspk_admin_ami" {}
variable "ni_adm" {}
