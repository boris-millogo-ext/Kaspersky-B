

# Network interfaces

resource "aws_network_interface" "gwp" {
  count = 4
  subnet_id       = "${var.aws_subnet_id}"
  private_ips     = ["${element(var.gw_priv_ips, count.index)}"]
  security_groups = ["${module.sg-gateway.aws_security_group_gateway_id}"]
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

# Outputs ID

output "aws_network_interface_kscp_id" {
  value = "${aws_network_interface.gwp.id}"
}

output "gateway_sg" {
  value = "${module.sg-gateway.aws_security_group_gateway_id}"
}
