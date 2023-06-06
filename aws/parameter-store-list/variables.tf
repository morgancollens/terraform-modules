variable "path_prefix" {
  type = string
  description = "The prefix to add to each key value as part of the parameter store key."
}

variable "string_parameters" {
  type = map(
    object({
        value: optional(string)
        description: string
        parameter_tier: optional(string)
    })
  )
  description = "A list of objects that will be stored as String parameters. The key param is used along with the path prefix to format the parameter store key path."
  default = {}
}

variable "secure_string_parameters" {
  type = map(
    object({
        value: string
        description: string
        parameter_tier: optional(string)
    })
  )
  description = "A list of objects that will be stored as SecureString parameters. The key param is used along with the path prefix to format the parameter store key path."
  default = {}
}

variable "string_list_parameters" {
  type = map(
    object({
        value: string
        description: string
        parameter_tier: optional(string)
    })
  )
  description = "A list of objects that will be stored as StringList parameters. The key param is used along with the path prefix to format the parameter store key path."
  default = {}
}

variable "kms_key_id" {
  type = any
  description = "(Optional) A KMS key identifier to use for encryption of SecureString parameters stored under the `secure_string_parameters` variable"
  default = null
}

variable "tags" {
  type = map(string)
  description = "(Optional) A set of tags to apply to the associated parameter resources."
  default = {}
}
