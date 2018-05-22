variable "vpc_cidr" {}
variable "zonea_cidr" {}
variable "zoneb_cidr" {}
variable "zonepubb_cidr" {}
variable "zonepuba_cidr" {}

#Tags
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

variable "new_vpc_name" {
  description = "VPC Code in form of AMIE + Number of account"
}

variable "aws_region" {
  description = "AWS Region selected"
}
variable "availability_zones_a" {
  description = "List of availability zones"
}
variable "availability_zones_b" {
  description = "List of availability zones"
}
/*
variable "shared_owner_id" {
  description = "Shared Account ID"
}

variable "shared_vpc" {
  description = "Shared Account"
}

variable "waf_owner_id" {
  description = "WAF Account ID"
}

variable "waf_vpc" {
  description = "WAF Account"
}
*/