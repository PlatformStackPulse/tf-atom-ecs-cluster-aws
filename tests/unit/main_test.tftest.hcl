# Unit Tests for tf-atom-ecs-cluster-aws
#
# These tests use a mock AWS provider — no real AWS calls are made.
# Run with:   terraform test -test-directory=tests/unit
# Run verbose: terraform test -test-directory=tests/unit -verbose
#
# NOTE: Assertions target plan-KNOWN values (the null-label id, resource
# counts, input pass-throughs) — NOT computed arn/id, which are unknown
# under a mock provider.

mock_provider "aws" {}

variables {
  namespace = "eg"
  stage     = "test"
  name      = "thing"

  container_insights_enabled = true
  execute_command_logging    = "DEFAULT"
}

# ---------------------------------------------------------------------------
# Test: module creates the ECS cluster when enabled (default)
# ---------------------------------------------------------------------------
run "creates_when_enabled" {
  command = plan

  assert {
    condition     = length(aws_ecs_cluster.this) == 1
    error_message = "Exactly one ECS cluster should be planned when enabled = true"
  }

  assert {
    condition     = aws_ecs_cluster.this[0].name == "eg-test-thing"
    error_message = "Cluster name should equal the null-label id 'eg-test-thing'"
  }

  assert {
    condition     = aws_ecs_cluster.this[0].setting[*].value == tolist(["enabled"])
    error_message = "Container Insights setting should be 'enabled' when container_insights_enabled = true"
  }
}

# ---------------------------------------------------------------------------
# Test: container insights can be disabled
# ---------------------------------------------------------------------------
run "container_insights_disabled" {
  command = plan

  variables {
    container_insights_enabled = false
  }

  assert {
    condition     = aws_ecs_cluster.this[0].setting[*].value == tolist(["disabled"])
    error_message = "Container Insights setting should be 'disabled' when container_insights_enabled = false"
  }
}

# ---------------------------------------------------------------------------
# Test: module creates nothing when disabled
# ---------------------------------------------------------------------------
run "disabled_creates_nothing" {
  command = plan

  variables {
    enabled = false
  }

  assert {
    condition     = length(aws_ecs_cluster.this) == 0
    error_message = "No ECS cluster should be planned when enabled = false"
  }

  assert {
    condition     = output.arn == null
    error_message = "arn output should be null when the module is disabled"
  }
}
