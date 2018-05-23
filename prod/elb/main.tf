#------- Creation of resorce ELB

resource "aws_elb" "elb_kscp" {
  name               = "${var.elb_name}"
  internal           = false
  security_groups    = ["${var.lb_sg_id}"]
  subnets            = ["${var.public_lb_subnet}"]

#------- Storing logs ELB to S3
  access_logs {
    bucket  = "amie01-s3-kaspersky-test"
    enabled = false
  }
  
#------- Listener and health check conf
  listener = [
    {
      instance_port     = "14000"
      instance_protocol = "HTTP"
      lb_port           = "14000"
      lb_protocol       = "HTTP"
    },
  ]
   health_check = [
    {
      target              = "HTTP:14000/"
      interval            = 30
      healthy_threshold   = 2
      unhealthy_threshold = 2
      timeout             = 5
    },
  ]

#------- ELB attachments
  instances = ["${var.instance_gw}"]

#------- Tags ELBS
  tags {
    Name = "${var.elb_name}"
    Application = "${var.tag_application}"
    EOTP = "${var.tag_eotp}"
    Environment = "${var.tag_environment}"
    Owner =  "${var.tag_owner}"
    Terraform =  "${var.tag_terraform}"
 }
}