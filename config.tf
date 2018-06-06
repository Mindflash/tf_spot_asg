data "aws_caller_identity" "current" {}

provider "aws" {
  region = "${var.region}"
}

data "aws_iam_policy_document" "instance_role" {
  statement {
    effect = "Allow"

    actions = [
      "sts:AssumeRole",
    ]

    principals {
      type = "Service"

      identifiers = [
        "ec2.amazonaws.com",
      ]
    }
  }
}

data "aws_iam_policy_document" "cloudwatch_policy" {
  statement {
    effect = "Allow"

    actions = [
      "logs:CreateLogGroup",
      "logs:CreateLogStream",
      "logs:PutLogEvents",
      "logs:DescribeLogStreams",
    ]

    resources = [
      "arn:aws:logs:*:*:*",
    ]
  }
}

resource "aws_iam_role" "instance_role" {
  name               = "${var.service_name}"
  assume_role_policy = "${data.aws_iam_policy_document.instance_role.json}"
}

resource "aws_iam_policy" "instance_cloudwatch_policy" {
  name        = "${var.service_name}"
  description = "ASG Policy for ${var.service_name}"
  policy      = "${data.aws_iam_policy_document.cloudwatch_policy.json}"
}

resource "aws_iam_policy_attachment" "instance_cloudwatch_attach" {
  name       = "${var.service_name}-cwl-attach"
  policy_arn = "${aws_iam_policy.instance_cloudwatch_policy.arn}"
  roles      = ["${aws_iam_role.instance_role.name}"]
}

resource "aws_iam_instance_profile" "asg_instance_profile" {
  name = "${var.service_name}-instance-profile"
  role = "${aws_iam_role.instance_role.name}"
}
