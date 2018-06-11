output "asg_id" {
  value = "${aws_autoscaling_group.asg.id}"
}

output "service_name_tag" {
  value = "${aws_launch_configuration.lc.name}"
}
