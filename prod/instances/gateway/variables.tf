# commons variables default

variable "instance_count" {
  default = 4
}

variable "tag_environment" {
  default = "PRD"
  description = "Name of the environment"}

variable "tag_eotp" {
  default = "10552244-Kaspersky "
  description = "Name of the EOTP"}

variable "tag_application" {
  default = "KASPERSKY"
  description = "Name of the application"}

variable "tag_owner" {
  default = "z10.watertech.fr.corpit.security-team.all.groups@veolia.com"
  description = "Name of the owner of the project"}

variable "tag_terraform" {
  default = "Yes"
  description = "If the project is terraformed"}

variable "tag_snapshot" {
  default = "TRUE"
  description = "Snapshot of instances: TRUE or FALSE"}

variable "instance_monitoring" {
  default = "true"
  description = "detailed monitoring enabled"}

variable "root_volume_type" {
  default = "gp2"
  description = "Type of root volume default"}

variable "aws_region" {
  default = "us-east-2"
  description = "AWS Region selected"}

variable "availability_zones" {
  default = "us-east-2a"
  description = "List of availability zones"}

variable "vpc_id" {
  default = ""
  description = "VPC ID"}

variable "subnet_ids" {
  default = ""
  description = "List of Subnet IDS"}

variable "aws_keyname" {
  default = "vwt-ksc-gateway"
  description = "Keypair for all instances for the project"}

# commons variables for kscp_gw_prod
variable "kscp_gw_instance_type" {default = "t2.medium"}

variable "kscp_gw_root_size" {default = "50"}

variable "kscp_gw_tag_name" {
  type = "list"
  default = ["AMIE79A1KSCGWP1","AMIE79A1KSCGWP2","AMIE79A1KSCGWP3","AMIE79A1KSCGWP4"]

variable "kscp_gw_tag_comments" {
  type = "list"
  default = ["Kaspersky Gateway1","Kaspersky Gateway2","Kaspersky Gateway3","Kaspersky Gateway4"]
}
variable "kscp_gw_ami" {
  /*type= "list"
  default = []*/
  default = ""
}

/*

# commons variables for kscp_gw1_prod

variable "kscp_gw1_tag_name" {default = "AMIE79A1KSCGWP1"}

variable "kscp_gw1_tag_comments" {default = "Kaspersky Gateway1"}

variable "kscp_gw1_ami" {default = ""}


# commons variables for kscp_gw2_prod

variable "kscp_gw2_tag_name" {default = "AMIE79B1KSCGWP2"}

variable "kscp_gw2_tag_comments" {default = "Kaspersky Gateway2"}

variable "kscp_gw2_ami" {default = ""}


# commons variables for kscp_gw3_prod

variable "kscp_gw3_tag_name" {default = "AMIE79B1KSCGWP3"}

variable "kscp_gw3_tag_comments" {default = "Kaspersky Gateway3"}

variable "kscp_gw3_ami" {default = ""}


# commons variables for kscp_gw4_prod

variable "kscp_gw4_tag_name" {default = "AMIE79B1KSCGWP4"}

variable "kscp_gw4_tag_comments" {default = "Kaspersky Gateway3"}

variable "kscp_gw4_ami" {default = ""}
*/

