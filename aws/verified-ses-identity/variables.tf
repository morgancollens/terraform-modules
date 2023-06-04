variable "identity" {
  type = string
  description = "The domain or email address to verify in Amazon SES"
}

variable "route53_zone_id" {
  type = string
}