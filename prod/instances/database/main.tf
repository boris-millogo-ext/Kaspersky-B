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
module "ni-database" {
  source = "../../network-interfaces/database"
}

resource "aws_instance" "kaspk_db"{
  ami = "${var.kaspk_db_ami}"
  tags {
    Name = "${var.kaspk_db_tag_name}"
    Comments = "${var.kaspk_db_tag_comments}"
    Application = "${var.tag_application}"
    EOTP = "${var.tag_eotp}"
    Environment = "${var.tag_environment}"
    Owner =  "${var.tag_owner}"
    Terraform =  "${var.tag_terraform}"
    Snapshot = "${var.tag_snapshot}"
  }
  instance_type = "${var.kaspk_db_instance_type}"
  root_block_device = {
    volume_type = "${var.root_volume_type}"
    volume_size = "${var.kaspk_db_root_size}"
  }
  monitoring = "${var.instance_monitoring}"
  key_name = "${var.aws_keyname}"
  network_interface {
    network_interface_id = "${module.ni-database.aws_network_interface_dbp1_id}"
    device_index = 0
  }
}


#################
#### Outputs ####
#################

output "aws_instance_kaspk_db_id" {
  value = "${module.ni-database.aws_instance.kaspk_db.id}"
}
