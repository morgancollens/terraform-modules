locals {
  is_email_identity = try(regex("@", var.identity), null) != null
}
