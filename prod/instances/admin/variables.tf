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
  default = "vwt-ksc-admin"
  description = "Keypair for admin instance for the project"}

# commons variables for kaspk_admin_prod

variable "kaspk_admin_tag_name" {default = "AMIE79A1KSCSERVP1"}

variable "kaspk_admin_instance_type" {default = "t2.medium"}

variable "kaspk_admin_root_size" {default = "100"}

variable "kaspk_admin_tag_comments" {default = "Kaspersky Admin"}

variable "kaspk_admin_ami" {default = ""}

