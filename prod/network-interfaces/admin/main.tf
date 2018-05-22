
resource "aws_network_interface" "servp1" {
  subnet_id       = "${var.aws_subnet_id}"
  private_ips     = "${var.priv_ip}"
  security_groups = ["${module.sg-admin.aws_security_group_admin_id}"]
  tags {
    Name = "${var.kscp_ni_name}"
    Comments = "${var.sg_description}"
    Application = "${var.tag_application}"
    EOTP = "${var.tag_eotp}"
    Environment = "${var.tag_environment}"
    Owner =  "${var.tag_owner}"
    Terraform =  "${var.tag_terraform}"
 }
}

#outputs#

output "admin_sg" {
  value = "${module.sg-admin.aws_security_group_admin_id}"
}

output "aws_network_interface_admin_id" {
  value = "${aws_network_interface.servp1.id}"
}
