
#-------Public A----------
resource "aws_instance" "kscp_gw_puba"{
  count = "${var.inst_puba_count}"
  ami = "${var.kscp_gw_ami}"
  tags {
    Name = "${element(var.kscp_gw_puba_tag_name, count.index)}"
    Comments = "${element(var.kscp_gw_puba_tag_comments, count.index)}"
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
    network_interface_id = "${element(var.ni_gw_puba, count.index)}"
    device_index = 0
  }
  volume_tags {
    Name = "${element(var.kscp_gw_puba_tag_name, count.index)}"
    Comments = "${element(var.kscp_gw_puba_tag_comments, count.index)}"
    Application = "${var.tag_application}"
    EOTP = "${var.tag_eotp}"
    Environment = "${var.tag_environment}"
    Owner =  "${var.tag_owner}"
    Terraform =  "${var.tag_terraform}"
    Snapshot = "${var.tag_snapshot}"
  }
}

#-------Public B----------

resource "aws_instance" "kscp_gw_pubb"{
  count = "${var.inst_pubb_count}"
  ami = "${var.kscp_gw_ami}"
  tags {
    Name = "${element(var.kscp_gw_pubb_tag_name, count.index)}"
    Comments = "${element(var.kscp_gw_pubb_tag_comments, count.index)}"
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
    network_interface_id = "${element(var.ni_gw_pubb, count.index)}"
    device_index = 0
  }
  volume_tags {
    Name = "${element(var.kscp_gw_pubb_tag_name, count.index)}"
    Comments = "${element(var.kscp_gw_pubb_tag_comments, count.index)}"
    Application = "${var.tag_application}"
    EOTP = "${var.tag_eotp}"
    Environment = "${var.tag_environment}"
    Owner =  "${var.tag_owner}"
    Terraform =  "${var.tag_terraform}"
    Snapshot = "${var.tag_snapshot}"
  }
}



#################
#### Outputs ####
#################

output "aws_instance_kscp_gw_puba_id" {
  value = "${aws_instance.kscp_gw_puba.*.id}"
}

output "aws_instance_kscp_gw_pubb_id" {
  value = "${aws_instance.kscp_gw_pubb.*.id}"
}