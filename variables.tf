variable "namespace" {
  type        = string
  description = "Namespace (e.g. `eg` or `cd`)"
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `production`, `testing`, `staging`)"
}

variable "name" {
  type        = string
  description = "Name of the application"
}

variable "tags" {
  type        = map(string)
  description = "Additional tags (_e.g._ { BusinessUnit : ABC })"
}

variable "label" {
  type        = string
  description = "Label for SG names"
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
}

variable "ecs_ports" {
  type        = list(string)
  description = "Create separate SG for each given port"
}

