
# Network interfaces

resource "aws_network_interface" "dbp1" {
  subnet_id       = "${var.aws_subnet_id}"
  private_ips     = ["10.84.36.91"]
  security_groups = ["${module.sg-database.aws_security_group_database_id}"]
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

output "aws_network_interface_dbp1_id" {
  value = "${aws_network_interface.dbp1.id}"
}

output "database_database_sg" {
  value = "${module.sg-database.aws_security_group_database_id}"
}
