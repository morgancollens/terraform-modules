resource "aws_route53_record" "txt" {
  count = local.is_email_identity ? 0 : 1
  zone_id = var.route53_zone_id
  name    = "_amazonses.${aws_ses_domain_identity.domain[0].id}"
  type    = "TXT"
  ttl     = "600"
  records = [aws_ses_domain_identity.domain[0].verification_token]
}

resource "aws_route53_record" "dkim" {
  count = local.is_email_identity ? 0 : 3
  zone_id = var.route53_zone_id
  name    = "${aws_ses_domain_dkim.dkim[0].dkim_tokens[count.index]}._domainkey"
  type    = "CNAME"
  ttl     = "600"
  records = ["${aws_ses_domain_dkim.dkim[0].dkim_tokens[count.index]}.dkim.amazonses.com"]
}