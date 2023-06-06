resource "aws_ssm_parameter" "secure_string_parameter" {
  for_each = var.secure_string_parameters
  name  = "${var.path_prefix}/${each.key}"
  type  = "SecureString"
  value = "${each.value.value}"
  description = "${each.value.description}"
  key_id = var.kms_key_id
  tags = var.tags
}

resource "aws_ssm_parameter" "string_parameter" {
  for_each = var.string_parameters
  name  = "${var.path_prefix}/${each.key}"
  type  = "String"
  value = "${each.value.value}"
  description = "${each.value.description}"
  tags = var.tags
  tier = "${each.value.parameter_tier}"
}

resource "aws_ssm_parameter" "string_list_parameter" {
  for_each = var.string_list_parameters
  name  = "${var.path_prefix}/${each.key}"
  type  = "String"
  value = "${each.value.value}"
  description = "${each.value.description}"
  tags = var.tags
  tier = "${each.value.parameter_tier}"
}