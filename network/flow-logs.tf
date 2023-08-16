resource "aws_cloudwatch_log_group" "log_group" {
  name = "/aws/vpc-flow-logs"
}

resource "aws_cloudwatch_log_stream" "log_stream_vpc1" {
  name           = "vpc1-flow-logs"
  log_group_name = aws_cloudwatch_log_group.log_group.name
}

resource "aws_cloudwatch_log_stream" "log_stream_vpc2" {
  name           = "vpc2-flow-logs"  
  log_group_name = aws_cloudwatch_log_group.log_group.name
}

resource "aws_flow_log" "flow_log_vpc1" {
  log_destination = aws_cloudwatch_log_group.log_group.arn
  log_destination_type = "cloud-watch-logs"
  traffic_type = "ALL"
  resource_id = aws_vpc.bastion_vpc.id
}

resource "aws_flow_log" "example_flow_log_vpc2" {
  log_destination = aws_cloudwatch_log_group.log_group.arn
  log_destination_type = "cloud-watch-logs"
  traffic_type = "ALL"
  resource_id = aws_vpc.apache_vpc.id
}