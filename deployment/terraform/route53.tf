resource "aws_route53_zone" "domain-name" {
    name = "akunne.me"
    
    tags = {
      Name = "akunne.me"
    }
}

resource "aws_route53_record" "record" {
    zone_id = aws_route53_zone.domain-name.zone_id
    name = "terraform-test.akunne.me"
    type = "CNAME"
    ttl = 300
    records = ["${aws_lb.server-load-balancer.dns_name}"]
}
