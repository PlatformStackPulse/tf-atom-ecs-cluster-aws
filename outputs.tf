output "id" {
  description = "ID of the ECS cluster"
  value       = try(aws_ecs_cluster.this[0].id, null)
}

output "arn" {
  description = "ARN of the ECS cluster"
  value       = try(aws_ecs_cluster.this[0].arn, null)
}

output "name" {
  description = "Name of the ECS cluster"
  value       = try(aws_ecs_cluster.this[0].name, null)
}
