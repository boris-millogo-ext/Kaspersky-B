
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

#################################
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
#################################


module "sg_admin" {
  source = "./sg/admin"
  aws_region = "${var.aws_region}"
  admin_sg_name = "${var.admin_sg_name}"
  sg_description = "${var.sg_description}"
  sg_vpc_id = "${var.sg_vpc_id}"
  tag_terraform = "${var.tag_terraform}"
}


module "sg_database" {
  source = "./sg/database"
  aws_region = "${var.aws_region}"
  database_sg_name = "${var.database_sg_name}"
  sg_description = "${var.sg_db_description}"
  sg_vpc_id = "${var.sg_vpc_id}"
  tag_terraform = "${var.tag_terraform}"
}
module "sg_gateway" {
  source = "./sg/gateway"
  aws_region = "${var.aws_region}"
  gateway_sg_name = "${var.gateway_sg_name}"
  sg_description = "${var.sg_gw_description}"
  sg_vpc_id = "${var.sg_vpc_id}"
  tag_terraform = "${var.tag_terraform}"
}


#################################
module "ni_admin" {
  source = "./network-interfaces/admin"
  aws_region = "${var.aws_region}"
  aws_subnet_id = "${var.aws_region}"
  tag_terraform = "${var.aws_region}"
}
/*
module "ni_database" {
  source = "./network-interfaces/database"

}
module "ni_gateway" {
  source = "./network-interfaces/gateway"

}
#################################
/*
module "ec2_admin" {
  source = "./instances/admin"
}
module "ec2_database" {
  source = "./instances/database"
}
module "ec2_gateway" {
  source = "./instances/gateway"
}

*/


