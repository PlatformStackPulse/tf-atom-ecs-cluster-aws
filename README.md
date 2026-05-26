# tf-atom-ecs-cluster-aws

[![CI](https://github.com/PlatformStackPulse/tf-atom-ecs-cluster-aws/actions/workflows/ci.yml/badge.svg)](https://github.com/PlatformStackPulse/tf-atom-ecs-cluster-aws/actions/workflows/ci.yml)
![Terraform](https://img.shields.io/badge/terraform-%3E%3D1.6.0-blueviolet)

## Purpose

ECS cluster with configurable capacity providers and container insights.

## Module Documentation

<!-- BEGIN_TF_DOCS -->
### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.6.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 5.0.0 |

### Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 5.0.0 |

### Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_this"></a> [this](#module\_this) | git::https://github.com/PlatformStackPulse/tf-label.git | v1.0.0 |

### Resources

| Name | Type |
|------|------|
| [aws_ecs_cluster.this](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/ecs_cluster) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_container_insights_enabled"></a> [container\_insights\_enabled](#input\_container\_insights\_enabled) | Enable CloudWatch Container Insights | `bool` | `true` | no |
| <a name="input_execute_command_logging"></a> [execute\_command\_logging](#input\_execute\_command\_logging) | Execute command logging mode (NONE, DEFAULT, OVERRIDE) | `string` | `"DEFAULT"` | no |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_arn"></a> [arn](#output\_arn) | ARN of the ECS cluster |
| <a name="output_id"></a> [id](#output\_id) | ID of the ECS cluster |
| <a name="output_name"></a> [name](#output\_name) | Name of the ECS cluster |
<!-- END_TF_DOCS -->
