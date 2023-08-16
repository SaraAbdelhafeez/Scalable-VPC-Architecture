resource "aws_route53_zone" "apache_hosted_zone" {
  name = "apache.com"  
}

resource "aws_route53_record" "apache_cname_record" {
  zone_id = aws_route53_zone.apache_hosted_zone.zone_id
  name    = "app.apache.com"
  type    = "CNAME"
  ttl     = 300  

  records = [
    module.compute.nlb_dns_name,
  ]
}