#Create the security group for network ingress/egress
resource "aws_security_group" "instance_security_group" {
  name        = "${var.service_name}-${var.env}-instance-sg"
  description = "Instance security group for ${var.service_name}"
  vpc_id      = "${var.vpc_id}"

  ingress {
    from_port   = 1
    to_port     = 65535
    protocol    = "TCP"
    cidr_blocks = ["${var.cidr_block}"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "TCP"
    cidr_blocks = ["10.5.0.0/16"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "template_file" "userdata" {
  template = "${file("${path.module}/userdata.sh")}"

  vars {
    env = "${var.env}"
  }
}

#Create AutoScaling Group

resource "random_id" "suffix" {
  /*   keepers = {
    # Generate a new id each time we switch to a new AMI id
    spot_id = "${module.fleet.fleet_request_id[0]}"
  } */

  byte_length = 2
}

resource "aws_placement_group" "pg" {
  name     = "pa-ami-${random_id.suffix.hex}"
  strategy = "spread"
}

resource "aws_launch_configuration" "lc" {
  name                 = "${var.service_name}-${var.version}"
  image_id             = "${var.ami_id}"
  instance_type        = "${var.instance_type}"
  security_groups      = ["${aws_security_group.instance_security_group.id}"]
  key_name             = "${var.key_name}"
  ebs_optimized        = false
  iam_instance_profile = "${aws_iam_instance_profile.asg_instance_profile.arn}"

  root_block_device {
    volume_size           = "20"
    volume_type           = "gp2"
    delete_on_termination = true
  }

  user_data = "${data.template_file.userdata.rendered}"

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_autoscaling_group" "asg" {
  name                 = "${var.service_name}-${var.version}"
  min_size             = "${var.min_size}"
  max_size             = "${var.max_size}"
  min_elb_capacity     = "${var.min_size}"
  launch_configuration = "${aws_launch_configuration.lc.id}"
  health_check_type    = "EC2"
  target_group_arns    = ["${var.target_group_arns}"]
  desired_capacity     = "${var.min_size}"
  vpc_zone_identifier  = ["${var.subnets}"]
  placement_group      = "${aws_placement_group.pg.id}"

  lifecycle {
    create_before_destroy = true
    ignore_changes        = ["target_group_arns"]
  }

  tag {
    key                 = "Name"
    value               = "${var.service_name}-${var.version}"
    propagate_at_launch = true
  }
}

#Cloudwatch autoscaling and monitoring
/* resource "aws_cloudwatch_metric_alarm" "us_east_1_pa_cluster_cpu_util_cloudwatch" {
  alarm_name          = "${var.service_name}-cpu-alarm"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "3"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = "120"
  statistic           = "Average"
  threshold           = "80"
  alarm_actions       = "${var.notification}"

  alarm_description = "CloudWatch metric alarm: pa-${var.env}-${var.region} ${var.cpu_util_metric_name} ${var.cpu_util_comparison_operator}"

  dimensions {
    ClusterName = "pa-${var.env}-${var.region}"
  }
} */

