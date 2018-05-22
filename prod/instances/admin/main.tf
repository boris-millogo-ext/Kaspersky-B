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
module "ni-admin" {
  source = "../../network-interfaces/admin"
}

resource "aws_instance" "kaspk_admin"{
  ami = "${var.kaspk_admin_ami}"
  tags {
    Name = "${var.kaspk_admin_tag_name}"
    Comments = "${var.kaspk_admin_tag_comments}"
    Application = "${var.tag_application}"
    EOTP = "${var.tag_eotp}"
    Environment = "${var.tag_environment}"
    Owner =  "${var.tag_owner}"
    Terraform =  "${var.tag_terraform}"
    Snapshot = "${var.tag_snapshot}"
  }
  instance_type = "${var.kaspk_admin_instance_type}"
  root_block_device = {
    volume_type = "${var.root_volume_type}"
    volume_size = "${var.kaspk_admin_root_size}"
  }
  monitoring = "${var.instance_monitoring}"
  key_name = "${var.aws_keyname}"
  network_interface {
    network_interface_id = "${module.ni-admin.aws_network_interface_admin_id}"
    device_index = 0
  }
}


#################
#### Outputs ####
#################

output "aws_instance_kaspk_admin_id" {
  value = "${aws_instance.kaspk_admin.id}"
}
