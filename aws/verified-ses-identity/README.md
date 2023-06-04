# AWS SES Verified Identity

This Terraform module creates and manages a domain or email identity in Amazon Web Services. It provides a reusable and configurable way to provision either a specific email or domain with consistent settings across different environments.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Usage](#usage)
- [Inputs](#inputs)
- [Outputs](#outputs)

## Prerequisites

Before using this Terraform module, ensure you have the following prerequisites:

- Terraform installed locally
- AWS CLI installed locally

## Usage

To use this module, include the following code in your Terraform configuration:

```hcl
data "aws_route53_zone" "main" {
  name         = "example.com"
  private_zone = false
}

module "ses_verified_domain" {
  source = "/path/to/module"

  identity = "example.com"
  route53_zone_id = data.aws_route53_zone.main.id
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|----------|
| identity | The identity you wish to verify. (Domain or email address) | `string` | None | Yes |
| route53_zone_id | The Route53 Zone ID in which to create identity verification records | `string` | None | Yes |

## Outputs


| Name | Description |
|------|-------------|
| email_identity_id | The ID of the created SES email identity |
| email_identity_arn | The ARN of the created SES email identity |
| email_identity | The email verified in SES |
| domain_identity_id | The ID of the created SES domain identity |
| domain_identity_arn | The ARN of the created SES domain identity |
| domain_identity | The domain verified in SES |

