#Generate the spot fleet request, loads Userdata to each instance to join it to the cluster
resource "aws_spot_fleet_request" "us_east1_fleet" {
  count                               = "${var.region == "us-east-1" ? 1 : 0}"
  iam_fleet_role                      = "${aws_iam_role.spot_fleet_role.arn}"
  allocation_strategy                 = "${var.allocation_strategy}"
  target_capacity                     = "${var.fleet_size}"
  valid_until                         = "${var.valid_until}"
  replace_unhealthy_instances         = true
  wait_for_fulfillment                = true
  terminate_instances_with_expiration = true
  target_group_arns                   = ["${var.target_groups}"]

  #TODO: Figure this out, relationship to other resources is problem
  lifecycle {
    create_before_destroy = true
  }

  ######################
  #m5.large
  ######################
  launch_specification {
    instance_type          = "m5.large"
    ami                    = "${var.ami_id}"
    key_name               = "${var.env}-${var.region}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 0)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }

  launch_specification {
    instance_type          = "m5.large"
    ami                    = "${var.ami_id}"
    key_name               = "${var.env}-${var.region}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 1)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }

  launch_specification {
    instance_type          = "m5.large"
    ami                    = "${var.ami_id}"
    key_name               = "${var.env}-${var.region}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 2)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }

  launch_specification {
    instance_type          = "m5.large"
    ami                    = "${var.ami_id}"
    key_name               = "${var.env}-${var.region}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 3)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }

  launch_specification {
    instance_type          = "m5.large"
    ami                    = "${var.ami_id}"
    key_name               = "${var.env}-${var.region}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 4)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }

  launch_specification {
    instance_type          = "m5.large"
    ami                    = "${var.ami_id}"
    key_name               = "${var.env}-${var.region}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 5)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }

  ######################
  #c5.large
  ######################
  launch_specification {
    instance_type          = "c5.large"
    ami                    = "${var.ami_id}"
    key_name               = "${var.env}-${var.region}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 0)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }

  launch_specification {
    instance_type          = "c5.large"
    ami                    = "${var.ami_id}"
    key_name               = "${var.env}-${var.region}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 1)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }

  launch_specification {
    instance_type          = "c5.large"
    ami                    = "${var.ami_id}"
    key_name               = "${var.env}-${var.region}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 2)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }

  launch_specification {
    instance_type          = "c5.large"
    ami                    = "${var.ami_id}"
    key_name               = "${var.env}-${var.region}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 3)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }

  launch_specification {
    instance_type          = "c5.large"
    ami                    = "${var.ami_id}"
    key_name               = "${var.env}-${var.region}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 4)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }

  launch_specification {
    instance_type          = "c5.large"
    ami                    = "${var.ami_id}"
    key_name               = "${var.env}-${var.region}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 5)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }

  ######################
  #r4.large
  ######################
  launch_specification {
    instance_type          = "r4.large"
    ami                    = "${var.ami_id}"
    key_name               = "${var.env}-${var.region}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 0)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }

  launch_specification {
    instance_type          = "r4.large"
    ami                    = "${var.ami_id}"
    key_name               = "${var.env}-${var.region}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 1)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }

  launch_specification {
    instance_type          = "r4.large"
    ami                    = "${var.ami_id}"
    key_name               = "${var.env}-${var.region}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 2)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }

  launch_specification {
    instance_type          = "r4.large"
    ami                    = "${var.ami_id}"
    key_name               = "${var.env}-${var.region}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 3)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }

  launch_specification {
    instance_type          = "r4.large"
    ami                    = "${var.ami_id}"
    key_name               = "${var.env}-${var.region}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 4)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }

  launch_specification {
    instance_type          = "r4.large"
    ami                    = "${var.ami_id}"
    key_name               = "${var.env}-${var.region}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 5)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }

  ######################
  #m5.xlarge
  ######################

  launch_specification {
    instance_type          = "m5.xlarge"
    ami                    = "${var.ami_id}"
    key_name               = "${var.key_name}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 0)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }
  launch_specification {
    instance_type          = "m5.xlarge"
    ami                    = "${var.ami_id}"
    key_name               = "${var.key_name}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 1)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }
  launch_specification {
    instance_type          = "m5.xlarge"
    ami                    = "${var.ami_id}"
    key_name               = "${var.key_name}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 2)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }
  launch_specification {
    instance_type          = "m5.xlarge"
    ami                    = "${var.ami_id}"
    key_name               = "${var.key_name}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 3)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }
  launch_specification {
    instance_type          = "m5.xlarge"
    ami                    = "${var.ami_id}"
    key_name               = "${var.key_name}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 4)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }
  launch_specification {
    instance_type          = "m5.xlarge"
    ami                    = "${var.ami_id}"
    key_name               = "${var.key_name}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 5)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }

  ######################
  #c5.xlarge
  ######################

  launch_specification {
    instance_type          = "c5.xlarge"
    ami                    = "${var.ami_id}"
    key_name               = "${var.key_name}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 0)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }
  launch_specification {
    instance_type          = "c5.xlarge"
    ami                    = "${var.ami_id}"
    key_name               = "${var.key_name}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 1)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }
  launch_specification {
    instance_type          = "c5.xlarge"
    ami                    = "${var.ami_id}"
    key_name               = "${var.key_name}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 2)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }
  launch_specification {
    instance_type          = "c5.xlarge"
    ami                    = "${var.ami_id}"
    key_name               = "${var.key_name}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 3)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }
  launch_specification {
    instance_type          = "c5.xlarge"
    ami                    = "${var.ami_id}"
    key_name               = "${var.key_name}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 4)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }
  launch_specification {
    instance_type          = "c5.xlarge"
    ami                    = "${var.ami_id}"
    key_name               = "${var.key_name}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 5)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }
  ######################
  #R4.xlarge
  ######################
  launch_specification {
    instance_type          = "r4.xlarge"
    ami                    = "${var.ami_id}"
    key_name               = "${var.key_name}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 0)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }
  launch_specification {
    instance_type          = "r4.xlarge"
    ami                    = "${var.ami_id}"
    key_name               = "${var.key_name}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 1)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }
  launch_specification {
    instance_type          = "r4.xlarge"
    ami                    = "${var.ami_id}"
    key_name               = "${var.key_name}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 2)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }
  launch_specification {
    instance_type          = "r4.xlarge"
    ami                    = "${var.ami_id}"
    key_name               = "${var.key_name}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 3)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }
  launch_specification {
    instance_type          = "r4.xlarge"
    ami                    = "${var.ami_id}"
    key_name               = "${var.key_name}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 4)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }
  launch_specification {
    instance_type          = "r4.xlarge"
    ami                    = "${var.ami_id}"
    key_name               = "${var.key_name}"
    iam_instance_profile   = "${aws_iam_instance_profile.instance_profile.name}"
    subnet_id              = "${element(data.terraform_remote_state.vpc.private_subnets, 5)}"
    vpc_security_group_ids = ["${aws_security_group.instance_security_group.id}"]

    ebs_block_device = {
      volume_type           = "gp2"
      volume_size           = "20"
      delete_on_termination = "true"
      device_name           = "/dev/xvda"
    }

    tags {
      Name = "${var.service_name}-spot-instance"
    }
  }
  depends_on = ["aws_iam_role.spot_instance_role", "aws_iam_role.spot_fleet_role"]
}

#Cloudwatch autoscaling and monitoring

resource "aws_appautoscaling_target" "us_east_1_service_target" {
  count        = "${var.region == "us-east-1" ? 1 : 0}"
  max_capacity = 10
  min_capacity = "${var.fleet_size}"
  resource_id  = "spot-fleet-request/${aws_spot_fleet_request.us_east1_fleet.id}"
  role_arn     = "arn:aws:iam::${data.aws_caller_identity.current.account_id}:role/aws-service-role/ec2.application-autoscaling.amazonaws.com/AWSServiceRoleForApplicationAutoScaling_EC2SpotFleetRequest"

  #role_arn           = "${aws_iam_role.autoscaling_role.arn}"  
  #for more see this bug https://github.com/terraform-providers/terraform-provider-aws/issues/240
  scalable_dimension = "ec2:spot-fleet-request:TargetCapacity"

  service_namespace = "ec2"
}

resource "aws_appautoscaling_policy" "us_east_1_service_down_policy" {
  name               = "scale-down-pa-${var.env}-${var.region}"
  resource_id        = "spot-fleet-request/${aws_spot_fleet_request.us_east1_fleet.id}"
  scalable_dimension = "ec2:spot-fleet-request:TargetCapacity"
  service_namespace  = "ec2"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Minimum"

    step_adjustment {
      metric_interval_upper_bound = 0
      scaling_adjustment          = -2
    }
  }

  depends_on = ["aws_appautoscaling_target.us_east_1_service_target"]
}

resource "aws_appautoscaling_policy" "us_east_1_service_up_policy" {
  count              = "${var.region == "us-east-1" ? 1 : 0}"
  name               = "scale-up-pa-${var.env}-${var.region}"
  resource_id        = "spot-fleet-request/${aws_spot_fleet_request.us_east1_fleet.id}"
  scalable_dimension = "ec2:spot-fleet-request:TargetCapacity"
  service_namespace  = "ec2"

  step_scaling_policy_configuration {
    adjustment_type         = "ChangeInCapacity"
    cooldown                = 60
    metric_aggregation_type = "Maximum"

    step_adjustment {
      metric_interval_lower_bound = 0
      scaling_adjustment          = 5
    }
  }

  depends_on = ["aws_appautoscaling_target.us_east_1_service_target"]
}

resource "aws_cloudwatch_metric_alarm" "us_east_1_service_cpu_scaling" {
  count               = "${var.region == "us-east-1" ? 1 : 0}"
  alarm_name          = "${var.service_name}-${var.env}-${var.region}-scaleup"
  comparison_operator = "GreaterThanOrEqualToThreshold"
  evaluation_periods  = "5"
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2Spot"
  period              = "60"
  statistic           = "Average"
  threshold           = "85"

  alarm_description = "CPU Autoscaling alarm to scale based on CPU"

  dimensions {
    FleetRequestId = "${aws_spot_fleet_request.us_east1_fleet.id}"
  }

  alarm_actions = [
    "${aws_appautoscaling_policy.us_east_1_service_up_policy.arn}",
  ]

  ok_actions = [
    "${aws_appautoscaling_policy.us_east_1_service_down_policy.arn}",
  ]

  depends_on = [
    "aws_appautoscaling_policy.us_east_1_service_up_policy",
    "aws_appautoscaling_policy.us_east_1_service_down_policy",
  ]
}
