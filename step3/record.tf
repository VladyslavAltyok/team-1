# DNS record for ALB
resource "aws_route53_record" "dev-ns" {
  zone_id = "Z02590222CJSB8B3L8J5T"          # Put your Host zone id
  name    = "wordpress.altyok.com"   # Put your domain name; wordpress.yourdomain.com
  type    = "CNAME"
  ttl     = "30"
  records = [aws_alb.application-lb.dns_name]

}