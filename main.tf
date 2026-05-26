resource "aws_ecs_cluster" "this" {
  count = local.enabled ? 1 : 0

  name = module.this.id

  setting {
    name  = "containerInsights"
    value = var.container_insights_enabled ? "enabled" : "disabled"
  }

  configuration {
    execute_command_configuration {
      logging = var.execute_command_logging
    }
  }

  tags = local.tags
}
