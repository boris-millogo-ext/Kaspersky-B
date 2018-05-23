output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "subnet_priv_a" {
value = "${module.vpc.subneta}"
}
output "subnet_priv_b" {
value = "${module.vpc.subnetb}"
}
output "subnet_pub_a" {
value = "${module.vpc.subnet_pubb}"
}
output "subnet_pub_b" {
value = "${module.vpc.subnet_pubb}"
}
output "subnets" {
value = "${join(",",module.vpc.subnets_id)}"
}