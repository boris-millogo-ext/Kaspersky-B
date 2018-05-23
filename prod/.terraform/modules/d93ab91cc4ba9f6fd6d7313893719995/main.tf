
# ingress for sg_database

resource "aws_security_group_rule" "sg_database_1" {
  security_group_id = "${aws_security_group.sg_database.id}"
  type            = "ingress"
  from_port       = "-1"
  to_port         = "-1"
  protocol        = "1"
  cidr_blocks     = ["10.0.0.0/8"]
  description     = "ICMP requests"
}

resource "aws_security_group_rule" "sg_database_2" {
  security_group_id = "${aws_security_group.sg_database.id}"
  type            = "ingress"
  from_port       = "161"
  to_port         = "161"
  protocol        = "udp"
  cidr_blocks     = ["10.154.200.10/32"]
  description     = "Monitoring POM"
}

resource "aws_security_group_rule" "sg_database_3" {
  security_group_id = "${aws_security_group.sg_database.id}"
  type            = "ingress"
  from_port       = "8530"
  to_port         = "8530"
  protocol        = "tcp"
  cidr_blocks     = ["10.154.200.54/32"]
  description     = "WSUS"
}

resource "aws_security_group_rule" "sg_database_4" {
  security_group_id = "${aws_security_group.sg_database.id}"
  type            = "ingress"
  from_port       = "3306"
  to_port         = "3306"
  protocol        = "tcp"
  source_security_group_id     = "${var.sg_admin_id}"
  description     = "SQL DATABASE"
}
resource "aws_security_group_rule" "sg_database_5" {
  security_group_id = "${aws_security_group.sg_database.id}"
  type            = "ingress"
  from_port       = "15000"
  to_port         = "15000"
  protocol        = "udp"
  source_security_group_id     = "${var.sg_admin_id}"
  description     = "Connection to the Administration Server"
}
resource "aws_security_group_rule" "sg_database_6" {
  security_group_id = "${aws_security_group.sg_database.id}"
  type            = "ingress"
  from_port       = "15001"
  to_port         = "15001"
  protocol        = "udp"
  source_security_group_id    = "${var.sg_admin_id}"
  description     = "Connection to the Update Agent"
}
# egress for database

resource "aws_security_group_rule" "sg_database_01" {
  security_group_id = "${aws_security_group.sg_database.id}"
  type        = "egress"
  from_port   = "-1"
  to_port     = "-1"
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

# DATABASE security Groups
resource "aws_security_group" "sg_database" {
  name        = "${var.database_sg_name}"
  description = "${var.sg_description}"
  vpc_id = "${var.sg_vpc_id}"

  tags {
    Name = "${var.database_sg_name}"
    Comments = "${var.sg_description}"
    Application = "${var.tag_application}"
    EOTP = "${var.tag_eotp}"
    Environment = "${var.tag_environment}"
    Owner =  "${var.tag_owner}"
    Terraform =  "${var.tag_terraform}"
 }
}

###########################
#Output security groups ID#
###########################

output "aws_security_group_database_id" {
  value = "${aws_security_group.sg_database.id}"
}
