output "email_identity_id" {
    value = try(aws_ses_email_identity.email[0].id, null)
}

output "email_identity_arn" {
  value = try(aws_ses_email_identity.email[0].arn, null)
}

output "email_identity" {
    value = try(aws_ses_email_identity.email[0].email, null)
}

output "domain_identity_id" {
    value = try(aws_ses_domain_identity.domain[0].id, null)
}

output "domain_identity_arn" {
  value = try(aws_ses_domain_identity.domain[0].arn, null)
}

output "domain_identity" {
  value = try(aws_ses_domain_identity.domain[0].domain, null)
}