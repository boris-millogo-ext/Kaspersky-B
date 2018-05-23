
# ----- Provider AWS ----------
provider "aws" {
  region = "${var.aws_region}"
}

# ----- Storing TFState to S3 ----------
terraform {
  backend "s3" {
    bucket = "amie01-s3-kaspersky-test"
    key    = "vpc/terraform.tfstate"
    region = "us-east-2"
  }
}

# ----- Building the VPC 
module "vpc" {
  source = "./vpc"
  vpc_cidr = "${var.vpc_cidr}"
  zoneb_cidr= "${var.zoneb_cidr}"
  zonepuba_cidr= "${var.zonepuba_cidr}"
  zonea_cidr= "${var.zonea_cidr}"
  zonepubb_cidr= "${var.zonepubb_cidr}"
  new_vpc_name= "${var.new_vpc_name}"
  tag_environment= "${var.tag_environment}"
  tag_eotp= "${var.tag_eotp}"
  tag_owner= "${var.tag_owner}"
  tag_application = "${var.tag_application}"
  availability_zones_a = "${var.availability_zones_a}"
  availability_zones_b = "${var.availability_zones_b}"
  aws_region = "${var.aws_region}"
}

# ----- Building the Security groups ----------

module "sg_admin" {
  source = "./sg/admin"
  aws_region = "${var.aws_region}"
  admin_sg_name = "${var.admin_sg_name}"
  sg_description = "${var.sg_description}"
  sg_vpc_id = "${module.vpc.vpc_id}"
  tag_terraform = "${var.tag_terraform}"
}

module "sg_database" {
  source = "./sg/database"
  aws_region = "${var.aws_region}"
  sg_admin_id = "${module.sg_admin.aws_security_group_admin_id}"
  database_sg_name = "${var.database_sg_name}"
  sg_description = "${var.sg_db_description}"
  sg_vpc_id = "${module.vpc.vpc_id}"
  tag_terraform = "${var.tag_terraform}"
}

module "sg_gateway" {
  source = "./sg/gateway"
  aws_region = "${var.aws_region}"
  sg_admin_id = "${module.sg_admin.aws_security_group_admin_id}"
  gateway_sg_name = "${var.gateway_sg_name}"
  sg_description = "${var.sg_gw_description}"
  sg_vpc_id = "${module.vpc.vpc_id}"
  tag_terraform = "${var.tag_terraform}"
  
}


# ----- Building the Network interfaces ----------

module "ni_admin" {
  source = "./network-interfaces/admin"
  aws_subnet_id = "${module.vpc.subneta}"
  priv_ip = ["${var.priv_ip_adm}"]
  secur_groups ="${module.sg_admin.aws_security_group_admin_id}"
  kscp_ni_name = "${var.kscp_ni_adm_name}"
  tag_terraform = "${var.tag_terraform}"
  aws_region = "${var.aws_region}"
}

module "ni_database" {
  source = "./network-interfaces/database"
  aws_subnet_id = "${module.vpc.subneta}"
  priv_ip = ["${var.priv_ip_db}"]
  secur_groups ="${module.sg_database.aws_security_group_database_id}"
  kscp_ni_name = "${var.kscp_ni_db_name}"
  tag_terraform = "${var.tag_terraform}"
  aws_region = "${var.aws_region}"
}

module "ni_gateway" {
  source = "./network-interfaces/gateway"
  aws_puba_subnet_id = "${module.vpc.subnet_puba}"
  aws_pubb_subnet_id = "${module.vpc.subnet_pubb}"
  gwpuba_priv_ips = ["${var.gwpuba_priv_ips}"]
  gwpubb_priv_ips = ["${var.gwpubb_priv_ips}"]
  secur_groups ="${module.sg_gateway.aws_security_group_gateway_id}"
  kscp_puba_ni_name = ["${var.kscp_puba_ni_name}"]
  kscp_pubb_ni_name = ["${var.kscp_pubb_ni_name}"]
  tag_terraform = "${var.tag_terraform}"
  aws_region = "${var.aws_region}"
}

# ----- Building instances  ----------

module "ec2_admin" {
  source = "./instances/admin"
  kaspk_admin_ami = "${var.kaspk_admin_ami}"
  ni_adm = "${module.ni_admin.aws_network_interface_admin_id}"
  root_volume_type = "${var.root_volume_type}"
  kaspk_admin_root_size = "${var.kaspk_admin_root_size}"
  kaspk_admin_tag_name = "${var.kaspk_admin_tag_name}"
  kaspk_admin_tag_comments = "${var.kaspk_admin_tag_comments}"
  kaspk_admin_instance_type = "${var.kaspk_admin_instance_type}"
  tag_application = "${var.tag_application}"
  tag_eotp = "${var.tag_eotp}"
  tag_environment = "${var.tag_environment}"
  tag_owner =  "${var.tag_owner}"
  tag_terraform =  "${var.tag_terraform}"
  tag_snapshot = "${var.tag_snapshot}"
  instance_monitoring = "${var.instance_monitoring}"
  aws_keyname = "${var.aws_keyname_adm}"
}
module "ec2_database" {
  source = "./instances/database"
  kaspk_db_ami = "${var.kaspk_db_ami}"
  ni_db = "${module.ni_database.aws_network_interface_dbp1_id}"
  root_volume_type = "${var.root_volume_type}"
  kaspk_db_root_size = "${var.kaspk_db_root_size}"
  kaspk_db_tag_name = "${var.kaspk_db_tag_name}"
  kaspk_db_tag_comments = "${var.kaspk_db_tag_comments}"
  kaspk_db_instance_type = "${var.kaspk_db_instance_type}"
  tag_application = "${var.tag_application}"
  tag_eotp = "${var.tag_eotp}"
  tag_environment = "${var.tag_environment}"
  tag_owner =  "${var.tag_owner}"
  tag_terraform =  "${var.tag_terraform}"
  tag_snapshot = "${var.tag_snapshot}"
  instance_monitoring = "${var.instance_monitoring}"
  aws_keyname = "${var.aws_keyname_db}"
}

module "ec2_gateway" {
  source = "./instances/gateway"
  kscp_gw_ami = "${var.kscp_gw_ami}"
  root_volume_type = "${var.root_volume_type}"
  kscp_gw_root_size = "${var.kscp_gw_root_size}"
  kscp_gw_instance_type = "${var.kscp_gw_instance_type}"
  tag_application = "${var.tag_application}"
  tag_eotp = "${var.tag_eotp}"
  tag_environment = "${var.tag_environment}"
  tag_owner =  "${var.tag_owner}"
  tag_terraform =  "${var.tag_terraform}"
  tag_snapshot = "${var.tag_snapshot}"
  instance_monitoring = "${var.instance_monitoring}"
  aws_keyname = "${var.aws_keyname_gw}"

  #Public A
  inst_puba_count = "${var.inst_puba_count}"
  kscp_gw_puba_tag_name = ["${var.kscp_gw_puba_tag_name}"]
  kscp_gw_puba_tag_comments = ["${var.kscp_gw_puba_tag_comments}"]
  ni_gw_puba = "${module.ni_gateway.aws_network_interface_kscp_puba_id}"
  #Public B
  inst_pubb_count = "${var.inst_pubb_count}"
  kscp_gw_pubb_tag_name = ["${var.kscp_gw_pubb_tag_name}"]
  kscp_gw_pubb_tag_comments = ["${var.kscp_gw_pubb_tag_comments}"]
  ni_gw_pubb = "${module.ni_gateway.aws_network_interface_kscp_pubb_id}"
}

# ----- Building the Load Balancer with HA ----------
module "elb" {
  source = "./elb"
  elb_name = "${var.elb_name}"
  lb_sg_id = ["${module.sg_gateway.aws_security_group_gateway_id}"]
  public_lb_subnet = ["${module.vpc.subnet_puba}", "${module.vpc.subnet_pubb}"]
  instance_gw = ["${module.ec2_gateway.aws_instance_kscp_gw_puba_id}", "${module.ec2_gateway.aws_instance_kscp_gw_pubb_id}"]
  tag_application = "${var.tag_application}"
  tag_eotp = "${var.tag_eotp}"
  tag_environment = "${var.tag_environment}"
  tag_owner =  "${var.tag_owner}"
  tag_terraform =  "${var.tag_terraform}"
}
