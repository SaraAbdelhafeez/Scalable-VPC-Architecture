resource "aws_iam_role" "vpc_role" {
  name = "VPCFlowLogsRole"  

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Effect": "Allow",
      "Principal": {
        "Service": "vpc-flow-logs.amazonaws.com"
      },
      "Action": "sts:AssumeRole"
    }
  ]
}
EOF
}
resource "aws_iam_role_policy_attachment" "vpc_role_attachment" {
  role       = aws_iam_role.vpc_role.name
  policy_arn = "arn:aws:iam::aws:policy/CloudWatchFullAccess"  
}