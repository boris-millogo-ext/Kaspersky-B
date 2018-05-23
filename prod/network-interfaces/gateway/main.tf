

# Network interfaces

resource "aws_network_interface" "gwp_puba" {
  count = 2
  subnet_id       = "${var.aws_puba_subnet_id}"
  private_ips     = ["${element(var.gwpuba_priv_ips, count.index)}"]
  security_groups = ["${var.secur_groups}"]
  tags {
    Name = "${element(var.kscp_puba_ni_name, count.index)}"
    Comments = "${var.sg_description}"
    Application = "${var.tag_application}"
    EOTP = "${var.tag_eotp}"
    Environment = "${var.tag_environment}"
    Owner =  "${var.tag_owner}"
    Terraform =  "${var.tag_terraform}"
 }
}
resource "aws_network_interface" "gwp_pubb" {
  count = 2
  subnet_id       = "${var.aws_pubb_subnet_id}"
  private_ips     = ["${element(var.gwpubb_priv_ips, count.index)}"]
  security_groups = ["${var.secur_groups}"]
  tags {
    Name = "${element(var.kscp_pubb_ni_name, count.index)}"
    Comments = "${var.sg_description}"
    Application = "${var.tag_application}"
    EOTP = "${var.tag_eotp}"
    Environment = "${var.tag_environment}"
    Owner =  "${var.tag_owner}"
    Terraform =  "${var.tag_terraform}"
 }
}
# Outputs ID

output "aws_network_interface_kscp_puba_id" {
  value = "${aws_network_interface.gwp_puba.*.id}"
}
output "aws_network_interface_kscp_pubb_id" {
  value = "${aws_network_interface.gwp_pubb.*.id}"
}
