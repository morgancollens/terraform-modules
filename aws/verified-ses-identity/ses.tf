resource "aws_ses_domain_identity" "domain" {
  count = local.is_email_identity ? 0 : 1
  domain = var.identity
}

resource "aws_ses_email_identity" "email" {
  count = local.is_email_identity ? 1 : 0
  email = var.identity
}

resource "aws_ses_domain_dkim" "dkim" {
  count = local.is_email_identity ? 0 : 1
  domain = aws_ses_domain_identity.domain[0].domain
}

resource "aws_ses_domain_identity_verification" "verification_check" {
  count = local.is_email_identity ? 0 : 1
  domain = aws_ses_domain_identity.domain[0].id

  depends_on = [
    aws_route53_record.txt[0],
  ]
}