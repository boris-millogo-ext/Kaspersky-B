output "vpc_id" {
  value = "${module.vpc.vpc_id}"
}

output "subneta" {
value = "${module.vpc.subneta}"
}

output "subnetb" {
value = "${module.vpc.subnetb}"
}
output "subnets" {
value = "${join(",",module.vpc.subnets_id)}"
}