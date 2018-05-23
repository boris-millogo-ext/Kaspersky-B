#----------------GENERAL---------------------------
tag_environment = "PRD"
tag_eotp = "10552244-Kaspersky "
tag_application = "KASPERSKY"
tag_owner = "z10.watertech.fr.corpit.security-team.all.groups@veolia.com"
tag_terraform = "Yes"
instance_monitoring = "true"
tag_snapshot = "TRUE"

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
admin_sg_name = "AMIE.SG.KSC.ADMIN"
sg_description = "Security group for Kaspersky Admin"

#----------------SG DATABASE---------------------------
database_sg_name = "AMIE.SG.KSC.DB"
sg_db_description = "Security group for Kaspersky Database"

#----------------SG GATEWAY---------------------------
gateway_sg_name = "AMIE.SG.KSC.GW"
sg_gw_description = "Security group for Kaspersky Gateway"

#----------------NI ADMIN---------------------------
priv_ip_adm = ["10.84.38.135"]
kscp_ni_adm_name = "AMIE79.NI.KSCP.ADM"

#----------------NI DATABASE---------------------------
priv_ip_db = ["10.84.38.140"]
kscp_ni_db_name = "AMIE79.NI.KSCP.DB"
#----------------NI GATEWAY---------------------------
kscp_ni_gw_name = "AMIE79.NI.KSCP.GW"
kscp_puba_ni_name = ["AMIE79.NI.KSCP.GW1","AMIE79.NI.KSCP.GW2"]
kscp_pubb_ni_name = ["AMIE79.NI.KSCP.GW3","AMIE79.NI.KSCP.GW4"]
gwpuba_priv_ips = ["10.84.38.198", "10.84.38.199"]
gwpubb_priv_ips = ["10.84.38.214","10.84.38.215"]
#----------------INSTANCE ADMIN---------------------------
root_volume_type = "gp2"
kaspk_admin_tag_name = "AMIE79A1KSCSERVP1"
kaspk_admin_instance_type = "t2.medium"
kaspk_admin_root_size = "100"
kaspk_admin_tag_comments = "Kaspersky Admin"
kaspk_admin_ami = "ami-922914f7"
aws_keyname_adm = "vwt-ksc-admin"
#----------------INSTANCE DATABASE---------------------------
kaspk_db_tag_name ="AMIE79A1KSCDBP1"
kaspk_db_instance_type = "m5.xlarge"
kaspk_db_root_size = "250"
kaspk_db_tag_comments ="Kaspersky Database"
kaspk_db_ami = "ami-922914f7"
aws_keyname_db = "vwt-ksc-db"
#----------------INSTANCE GATEWAY---------------------------
kscp_gw_instance_type = "t2.medium"
kscp_gw_root_size= "50"
kscp_gw_puba_tag_name = ["AMIE79A1KSCGWP1","AMIE79A1KSCGWP2"]
kscp_gw_pubb_tag_name = ["AMIE79A1KSCGWP3","AMIE79A1KSCGWP4"]
kscp_gw_puba_tag_comments = ["Kaspersky Gateway1","Kaspersky Gateway2"]
kscp_gw_pubb_tag_comments = ["Kaspersky Gateway3","Kaspersky Gateway4"]
kscp_gw_ami= "ami-922914f7"
aws_keyname_gw = "vwt-ksc-gateway"
inst_puba_count = 2
inst_pubb_count = 2
#---------------- ELB ---------------------------
elb_name = "AMIE79KSCP1-NLB"

