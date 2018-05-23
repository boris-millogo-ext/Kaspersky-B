
# ingress for sg_admin

resource "aws_security_group_rule" "sg_admin_1" {
  security_group_id = "${aws_security_group.sg_admin.id}"
  type            = "ingress"
  from_port       = "13000"
  to_port         = "13000"
  protocol        = "tcp"
  cidr_blocks     = ["10.0.0.0/8","172.16.0.0/12"]
  description     = "Receiving data from client computers"
}

resource "aws_security_group_rule" "sg_admin_2" {
  security_group_id = "${aws_security_group.sg_admin.id}"
  type            = "ingress"
  from_port       = "14000"
  to_port         = "14000"
  protocol        = "tcp"
  cidr_blocks     = ["10.0.0.0/8","172.16.0.0/12"]
  description     = "Receiving data from client computers"
}

resource "aws_security_group_rule" "sg_admin_3" {
  security_group_id = "${aws_security_group.sg_admin.id}"
  type            = "ingress"
  from_port       = "8060"
  to_port         = "8061"
  protocol        = "tcp"
  cidr_blocks     = ["10.0.0.0/8","172.16.0.0/12"]
  description     = "Kaspersky Security Center Web Console / SSL"
}

resource "aws_security_group_rule" "sg_admin_4" {
  security_group_id = "${aws_security_group.sg_admin.id}"
  type            = "ingress"
  from_port       = "13111"
  to_port         = "13111"
  protocol        = "tcp"
  cidr_blocks     = ["10.0.0.0/8","172.16.0.0/12"]
  description     = "Connecting to the KSN proxy server"
}

resource "aws_security_group_rule" "sg_admin_5" {
  security_group_id = "${aws_security_group.sg_admin.id}"
  type            = "ingress"
  from_port       = "14001"
  to_port         = "14001"
  protocol        = "tcp"
  cidr_blocks     = ["10.0.0.0/8","172.16.0.0/12"]
  description     = "connecting to the Update Agent"
}

resource "aws_security_group_rule" "sg_admin_6" {
  security_group_id = "${aws_security_group.sg_admin.id}"
  type            = "ingress"
  from_port       = "3389"
  to_port         = "3389"
  protocol        = "tcp"
  cidr_blocks     = ["10.0.0.0/8"]
  description     = "RDP session host"
}

resource "aws_security_group_rule" "sg_admin_7" {
  security_group_id = "${aws_security_group.sg_admin.id}"
  type            = "ingress"
  from_port       = "-1"
  to_port         = "-1"
  protocol        = "1"
  cidr_blocks     = ["10.0.0.0/8"]
  description     = "ICMP requests"
}

resource "aws_security_group_rule" "sg_admin_8" {
  security_group_id = "${aws_security_group.sg_admin.id}"
  type            = "ingress"
  from_port       = "161"
  to_port         = "161"
  protocol        = "udp"
  cidr_blocks     = ["10.154.200.10/32"]
  description     = "Monitoring POM"
}

resource "aws_security_group_rule" "sg_admin_9" {
  security_group_id = "${aws_security_group.sg_admin.id}"
  type            = "ingress"
  from_port       = "8530"
  to_port         = "8530"
  protocol        = "tcp"
  cidr_blocks     = ["10.154.200.54/32"]
  description     = "WSUS"
}

# egress for admin

resource "aws_security_group_rule" "sg_admin_01" {
  security_group_id = "${aws_security_group.sg_admin.id}"
  type        = "egress"
  from_port   = "-1"
  to_port     = "-1"
  protocol    = "-1"
  cidr_blocks = ["0.0.0.0/0"]
}

# ADMIN security Groups
resource "aws_security_group" "sg_admin" {
  name        = "${var.admin_sg_name}"
  description = "${var.sg_description}"
  vpc_id = "${var.sg_vpc_id}"

  tags {
    Name = "${var.admin_sg_name}"
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

output "aws_security_group_admin_id" {
  value = "${aws_security_group.sg_admin.id}"
}
