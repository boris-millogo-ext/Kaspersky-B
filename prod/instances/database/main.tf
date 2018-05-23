
resource "aws_instance" "kaspk_db"{
  ami = "${var.kaspk_db_ami}"
  instance_type = "${var.kaspk_db_instance_type}"
  root_block_device = {
    volume_type = "${var.root_volume_type}"
    volume_size = "${var.kaspk_db_root_size}"
  }
  monitoring = "${var.instance_monitoring}"
  key_name = "${var.aws_keyname}"
  network_interface {
    network_interface_id = "${var.ni_db}"
    device_index = 0
  }
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
  volume_tags {
    Name = "${var.kaspk_db_tag_name}"
    Comments = "${var.kaspk_db_tag_comments}"
    Application = "${var.tag_application}"
    EOTP = "${var.tag_eotp}"
    #Environment = "${var.tag_environment}"
    Owner =  "${var.tag_owner}"
    Terraform =  "${var.tag_terraform}"
    Snapshot = "${var.tag_snapshot}"
  }
}


#################
#### Outputs ####
#################

output "aws_instance_kaspk_db_id" {
  value = "${aws_instance.kaspk_db.id}"
}
