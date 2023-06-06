# Terraform Modules

This project contains reusable terraform modules that can be referenced directly for any project.

## Prerequisites

Make sure you have the following prerequisites installed on your local machine:

- [Terraform](https://www.terraform.io/downloads.html)
- [AWS CLI](https://aws.amazon.com/cli/)


## Modules

A list of the different modules available through this repository is below.

| Module Name | Description |
|-------------|-------------|
| [`verified-ses-identity`](./aws/verified-ses-identity/)   | Allows for the full creation and verification of a domain or email identity in Amazon SES |
| [`parameter-store-list`](./aws/parameter-store-list/)   | Allows for easier grouping and creation of parameters within AWS Systems Manager, Parameter Store |