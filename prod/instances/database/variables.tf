# commons variables default

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
  default = "vwt-kasperky"
  description = "Keypair for all instances for the project"}

# commons variables for kaspk_db_prod

variable "kaspk_db_tag_name" {default = "AMIE79A1KSCDBP1"}

variable "kaspk_db_instance_type" {default = "m5.xlarge"}

variable "kaspk_db_root_size" {default = "250"}

variable "kaspk_db_tag_comments" {default = "Kaspersky Database"}

variable "kaspk_db_ami" {default = ""}

# commons variables for kaspk_db_uat

variable "kaspk_db_uat_tag_name" {default = ""}

variable "kaspk_db_uat_instance_type" {default = "m5.xlarge"}

variable "kaspk_db_uat_root_size" {default = "250"}

variable "kaspk_db_uat_tag_comments" {default = "Kaspersky Database"}

variable "kaspk_db_uat_ami" {default = ""}
