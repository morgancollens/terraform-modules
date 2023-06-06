# AWS Parameter Store List

This Terraform module that allows for the easy grouping and storage of parameters and secrets within AWS Systems Manager (Parameter Store). The module is designed to format module key paths under a unified naming convention,
and allow users to not have to define individual `aws_ssm_parameter` resources for each variable.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Inputs](#inputs)

## Prerequisites

Before using this Terraform module, ensure you have the following prerequisites:

- Terraform installed locally
- AWS CLI installed locally

## Usage

To use this module, include the following code in your Terraform configuration:

```hcl
data "aws_kms_key" "kms_key" {
  key_id = "alias/app.example.com"
}

module "param_store_list" {
    source = "../../terraform-modules/aws/parameter-store-list"
    path_prefix = "app.example.com/production"
    kms_key_id = data.aws_kms_key.kms_key.key_id

    secure_string_parameters = {
        JWT_SECRET = {
            value: "example"
            description: "The JWT secret that the application uses."
        }
    }

    string_parameters = {
        REGION = {
            value: "ca-central-1"
            description: "The default AWS region for all applications."
        }
        APP_ENDPOINT = {
            value: "https://app.example.com"
            description: "The HTTPS endpoint in which users access the application."
        }
    }

    string_list_parameters = {
      SMTP_CREDENTIALS = {
        value: "host=smtp.example.com,user=root,password=example,port=465"
        description: "The SMTP port in which application emails are sent."
      }
    }

    tags = {
        REGION = "ca-central-1"
        ENVIRONMENT = "production"
    }
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| path_prefix | The prefix to add to each key value as part of the parameter store key. | `string` | None | Yes |
| string_parameters | A list of objects that will be stored as String parameters. The key param is used along with the path prefix to format the parameter store key path. | `map(object({ value: string, description: string, parameter_tier: string }))` | `{}` | No |
| string_list_parameters | A list of objects that will be stored as StringList parameters. The key param is used along with the path prefix to format the parameter store key path. | `map(object({ value: string, description: string, parameter_tier: string }))` | `{}` | No |
| secure_string_parameters | A list of objects that will be stored as SecureString parameters. The key param is used along with the path prefix to format the parameter store key path. | `map(object({ value: string, description: string, parameter_tier: string }))` | `{}` | No |
| kms_key_id | (Optional) A KMS key identifier to use for encryption of SecureString parameters stored under the `secure_string_parameters` variable | `string` | None | No |
| tags | (Optional) A set of tags to apply to the associated parameter resources. | `map(string)` | `{}` | No |
