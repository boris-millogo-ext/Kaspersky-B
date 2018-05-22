
# -------------- VPC -------------
variable "vpc_cidr"{}

variable "zoneb_cidr"{}
variable "zonepuba_cidr"{}
variable "new_vpc_name"{}
variable "zonea_cidr"{}
variable "zonepubb_cidr"{}
variable "tag_environment"{}
variable "tag_eotp"{}
variable "tag_application"{}
variable "tag_owner"{}
variable "aws_region" {
  description = "AWS Region selected"
}
variable "availability_zones_a" {
  description = "List of availability zones"
}
variable "availability_zones_b" {
  description = "List of availability zones"
}

# -------------- SG -------------
variable "sg_vpc_id" {}
variable "tag_terraform" {}
variable "sg_description" {}
variable "admin_sg_name" {}
variable "database_sg_name"{}
variable "gateway_sg_name"{}
variable "sg_gw_description"{}
variable "sg_db_description"{}
# -------------- VPC -------------
# -------------- VPC -------------
# -------------- VPC -------------