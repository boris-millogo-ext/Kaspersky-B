
resource "aws_vpc_dhcp_options" "dhcp_options_vws" {
  domain_name          = "vws.vh20.net"
  domain_name_servers  = ["10.154.200.92", "10.154.200.139"]
  ntp_servers          = ["10.152.100.19"]
  tags {
    Name = "amiedubDHCP1"
    Application = "${var.tag_application}"
    EOTP = "${var.tag_eotp}"
    Environment = "${var.tag_environment}"
    Owner =  "${var.tag_owner}"
    Terraform =  "Yes"
  }
}

##

resource "aws_vpc" "new_vpc" {
    cidr_block = "${var.vpc_cidr}"
    enable_dns_hostnames = true
    tags {
      Name = "${var.new_vpc_name}.VPC.${var.tag_application}.${var.tag_environment}"
      Application = "${var.tag_application}"
      EOTP = "${var.tag_eotp}"
      Environment = "${var.tag_environment}"
      Owner =  "${var.tag_owner}"
      Terraform =  "Yes"
  }
}

  resource "aws_vpc_dhcp_options_association" "dns_resolver" {
    vpc_id          = "${aws_vpc.new_vpc.id}"
    dhcp_options_id = "${aws_vpc_dhcp_options.dhcp_options_vws.id}"
  }

resource "aws_subnet" "subneta" {
  vpc_id                  = "${aws_vpc.new_vpc.id}"
  availability_zone       = "${var.availability_zones_a}"
  map_public_ip_on_launch = false
  cidr_block              = "${var.zonea_cidr}"

  tags {
    Name = "${var.new_vpc_name}-NET1a-PRI-${var.tag_environment}"
    Application = "${var.tag_application}"
    EOTP = "${var.tag_eotp}"
    Environment = "${var.tag_environment}"
    Owner =  "${var.tag_owner}"
    Terraform =  "Yes"
}
}

resource "aws_subnet" "subnetb" {
  vpc_id                  = "${aws_vpc.new_vpc.id}"
  availability_zone       = "${var.availability_zones_b}"
  map_public_ip_on_launch = false
  cidr_block              = "${var.zoneb_cidr}"

  tags {
    Name = "${var.new_vpc_name}-NET1b-PRI-${var.tag_environment}"
    Application = "${var.tag_application}"
    EOTP = "${var.tag_eotp}"
    Environment = "${var.tag_environment}"
    Owner =  "${var.tag_owner}"
    Terraform =  "Yes"
  }
}

resource "aws_subnet" "subnetpuba" {
  vpc_id                  = "${aws_vpc.new_vpc.id}"
  availability_zone       = "${var.availability_zones_b}"
  map_public_ip_on_launch = true
  cidr_block              = "${var.zonepuba_cidr}"

  tags {
    Name = "${var.new_vpc_name}-NET1b-PUB-${var.tag_environment}"
    Application = "${var.tag_application}"
    EOTP = "${var.tag_eotp}"
    Environment = "${var.tag_environment}"
    Owner =  "${var.tag_owner}"
    Terraform =  "Yes"
  }
}

resource "aws_subnet" "subnetpubb" {
  vpc_id                  = "${aws_vpc.new_vpc.id}"
  availability_zone       = "${var.availability_zones_b}"
  map_public_ip_on_launch = true
  cidr_block              = "${var.zonepubb_cidr}"

  tags {
    Name = "${var.new_vpc_name}-NET1b-PUB-${var.tag_environment}"
    Application = "${var.tag_application}"
    EOTP = "${var.tag_eotp}"
    Environment = "${var.tag_environment}"
    Owner =  "${var.tag_owner}"
    Terraform =  "Yes"
  }
}
#
resource "aws_route_table" "rt" {
  vpc_id = "${aws_vpc.new_vpc.id}"
  tags {
        Name = "${var.new_vpc_name}-RIB-PRI-${var.tag_environment}"
        Application = "${var.tag_application}"
        EOTP = "${var.tag_eotp}"
        Environment = "${var.tag_environment}"
        Owner =  "${var.tag_owner}"
        Terraform =  "Yes"
    }
  route {
    cidr_block = "10.154.200.0/23"
    #vpc_peering_connection_id = "${aws_vpc_peering_connection.vpc_shared.id}"
  }
  route {
    cidr_block = "10.84.2.0/25"
    #vpc_peering_connection_id = "${aws_vpc_peering_connection.vpc_waf.id}"
  }
}

resource "aws_route_table_association" "a" {
    subnet_id      = "${aws_subnet.subneta.id}"
    route_table_id = "${aws_route_table.rt.id}"
}

resource "aws_route_table_association" "b" {
    subnet_id      = "${aws_subnet.subnetb.id}"
    route_table_id = "${aws_route_table.rt.id}"
}
/*
  resource "aws_vpc_peering_connection" "vpc_shared" {
    peer_owner_id = "${var.shared_owner_id}"
    peer_vpc_id   = "${var.shared_vpc}"
    vpc_id        = "${aws_vpc.new_vpc.id}"

  tags {
    Name = "ToVPC.SHARED"
  }
}

  resource "aws_vpc_peering_connection" "vpc_waf" {
    peer_owner_id = "${var.waf_owner_id}"
    peer_vpc_id   = "${var.waf_vpc}"
    vpc_id        = "${aws_vpc.new_vpc.id}"

  tags {
    Name = "ToVPC.WAF"
  }
}

resource "aws_vpn_gateway" "vpn_gw" {
  vpc_id = "${aws_vpc.new_vpc.id}"

  tags {
    Name = "${var.new_vpc_name}-VPG-${var.tag_application}.${var.tag_environment}"
    Application = "${var.tag_application}"
    EOTP = "${var.tag_eotp}"
    Environment = "${var.tag_environment}"
    Owner =  "${var.tag_owner}"
    Terraform =  "Yes"
}
}

resource "aws_vpn_gateway_route_propagation" "vpg_propagation" {
  vpn_gateway_id = "${aws_vpn_gateway.vpn_gw.id}"
  route_table_id = "${aws_route_table.rt.id}"
}
*/
resource "aws_vpc_endpoint" "private-s3" {
  vpc_id = "${aws_vpc.new_vpc.id}"
  service_name = "com.amazonaws.eu-west-1.s3"
  route_table_ids = ["${aws_route_table.rt.id}"]
  policy = <<POLICY
{
  "Statement": [
      {
          "Action": [
            "S3:*"
          ],
          "Effect": "Allow",
          "Resource": "*",
          "Principal": "*"
      }
  ]
}
POLICY
}

#Ouput variables for use by other modules
output "route_table_id" {
  value = "${aws_route_table.rt.id}"
}
/*
output "aws_vpc_peering_connection_1" {
  value = "${aws_vpc_peering_connection.vpc_shared.id}"
}

output "aws_vpc_peering_connection_2" {
  value = "${aws_vpc_peering_connection.vpc_waf.id}"
}
*/
output "vpc_id" {
  value = "${aws_vpc.new_vpc.id}"
}

output "subneta" {
value = "${aws_subnet.subneta.id}"
}

output "subnetb" {
value = "${aws_subnet.subnetb.id}"

}
output "subnets_id" {
value = ["${aws_subnet.subneta.id}, ${aws_subnet.subnetb.id}"]
}
