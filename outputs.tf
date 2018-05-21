output "fleet_request_id" {
  value = "${aws_spot_fleet_request.us_east1_fleet.*.id}"
}
