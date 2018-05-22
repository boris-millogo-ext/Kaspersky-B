#----------------GENERAL---------------------------
tag_environment = "PRD"
tag_eotp = "10552244-Kaspersky "
tag_application = "KASPERSKY"
tag_owner = "z10.watertech.fr.corpit.security-team.all.groups@veolia.com"
tag_terraform = "Yes"
#----------------VPC---------------------------
vpc_cidr = "10.84.38.128/25"

zonea_cidr = "10.84.38.128/27"
zoneb_cidr = "10.84.38.160/27"

zonepuba_cidr = "10.84.38.192/28"
zonepubb_cidr = "10.84.38.208/28"

shared_owner_id = "810499002773"
shared_vpc = "vpc-14f86071"

waf_owner_id = "297110339970"
waf_vpc = "vpc-da00f5bd"

new_vpc_name = "AMIE79"

aws_region= "us-east-2"
availability_zones_a= "us-east-2a"
availability_zones_b = "us-east-2b"

#----------------SG ADMIN---------------------------
sg_vpc_id = "vpc-0186c769"
admin_sg_name = "AMIE.SG.KSC.ADMIN"
sg_description = "Security group for Kaspersky Admin"
#----------------SG DATABASE---------------------------
database_sg_name = "AMIE.SG.KSC.DB"
sg_db_description = "Security group for Kaspersky Database"
#----------------SG GATEWAY---------------------------
gateway_sg_name = "AMIE.SG.KSC.GW"
sg_gw_description = "Security group for Kaspersky Gateway"
#----------------NI ADMIN---------------------------

#----------------NI DATABASE---------------------------

#----------------NI GATEWAY---------------------------

#----------------INSTANCE ADMIN---------------------------

#----------------INSTANCE DATABASE---------------------------

#----------------INSTANCE GATEWAY---------------------------