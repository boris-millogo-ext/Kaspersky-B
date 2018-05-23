# Network interfaces

resource "aws_network_interface" "servp1" {
  subnet_id       = "${var.aws_subnet_id}"
  private_ips     = ["${var.priv_ip}"]
  security_groups = ["${var.secur_groups}"]
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

output "aws_network_interface_admin_id" {
  value = "${aws_network_interface.servp1.id}"
}
