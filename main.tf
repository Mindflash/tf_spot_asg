#Create the security group for network ingress/egress
resource "aws_security_group" "instance_security_group" {
  name        = "${var.service_name}-${var.env}-instance-sg"
  description = "Instance security group for ${var.service_name}"
  vpc_id      = "${data.terraform_remote_state.vpc.vpc_id}"

  ingress {
    from_port   = 1
    to_port     = 65535
    protocol    = "TCP"
    cidr_blocks = ["${data.aws_vpc.vpc.cidr_block}"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
