
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
variable "tag_terraform" {}
variable "sg_description" {}
variable "admin_sg_name" {}
variable "database_sg_name"{}
variable "gateway_sg_name"{}
variable "sg_gw_description"{}
variable "sg_db_description"{}
# -------------- NI -------------
variable "priv_ip_adm"{type = "list"}
variable "priv_ip_db"{type = "list"}
variable "kscp_ni_adm_name"{}
variable "kscp_ni_db_name"{}
variable "kscp_ni_gw_name"{}
variable "kscp_puba_ni_name" {type = "list"}
variable "kscp_pubb_ni_name" {type = "list"}
variable "gwpubb_priv_ips"{type = "list"}
variable "gwpuba_priv_ips"{type = "list"}

# -------------- INSTANCES -------------
variable "root_volume_type" {}
variable "instance_monitoring" {}
variable "tag_snapshot"{}
variable "aws_keyname_adm" {}
variable "kaspk_admin_tag_name" {}
variable "kaspk_admin_instance_type" {}
variable "kaspk_admin_root_size" {}
variable "kaspk_admin_tag_comments" {}
variable "kaspk_admin_ami" {}

variable "aws_keyname_db" {}
variable "kaspk_db_tag_name" {}
variable "kaspk_db_instance_type" {}
variable "kaspk_db_root_size" {}
variable "kaspk_db_tag_comments" {}
variable "kaspk_db_ami" {}

variable "aws_keyname_gw" {}
variable "kscp_gw_instance_type" {}
variable "kscp_gw_root_size" {}
variable "kscp_gw_ami" {
  /*type= "list"
  default = []*/
  default = ""
}
variable "inst_puba_count" {}
variable "inst_pubb_count" {}
variable "kscp_gw_puba_tag_name" {type = "list"}
variable "kscp_gw_pubb_tag_name" {type = "list"}
variable "kscp_gw_puba_tag_comments" {type = "list"}
variable "kscp_gw_pubb_tag_comments" {type = "list"}

# --------------- ELB ------------------
variable "elb_name" {}
