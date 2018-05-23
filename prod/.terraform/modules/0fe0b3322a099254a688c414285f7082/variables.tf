#--------- Variables ELB
variable "elb_name" {}
variable "lb_sg_id" {type ="list"}
variable "public_lb_subnet" {type ="list"}
variable "tag_environment" {}
variable "tag_eotp" {}
variable "tag_application" {}
variable "tag_owner" {}
variable "tag_terraform" {}
variable "instance_gw" {type = "list"}