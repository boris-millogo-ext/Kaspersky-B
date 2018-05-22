provider "aws" {
  region = "${var.aws_region}"
}
# The command below Uses
terraform {
  backend "s3" {
    bucket = "amie01-s3-kaspersky-test"
    key    = "vpc/terraform.tfstate"
    region = "us-east-2"
  }
}
module "ni-gateway" {
  source = "../../network-interfaces/gateway"
}

resource "aws_instance" "kscp_gw"{
  count = "${var.instance_count}"
  ami = "${var.kscp_gw_ami}"
  tags {
    Name = "${element(var.kscp_gw_tag_name, count.index)}"
    Comments = "${element(var.kscp_gw_tag_comments, count.index)}"
    Application = "${var.tag_application}"
    EOTP = "${var.tag_eotp}"
    Environment = "${var.tag_environment}"
    Owner =  "${var.tag_owner}"
    Terraform =  "${var.tag_terraform}"
    Snapshot = "${var.tag_snapshot}"
  }
  instance_type = "${var.kscp_gw_instance_type}"
  root_block_device = {
    volume_type = "${var.root_volume_type}"
    volume_size = "${var.kscp_gw_root_size}"
  }
  monitoring = "${var.instance_monitoring}"
  key_name = "${var.aws_keyname}"
  network_interface {
    network_interface_id = "${module.ni-gateway.aws_network_interface_kscp_id}"
    device_index = 0
  }
}



#################
#### Outputs ####
#################

output "aws_instance_kscp_gw_id" {
  value = "${aws_instance.kscp_gw.*.id}"
}