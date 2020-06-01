variable "namespace" {
  type        = string
  description = "Namespace (e.g. `eg` or `cd`)"
  default     = ""
}

variable "stage" {
  type        = string
  description = "Stage (e.g. `production`, `testing`, `staging`)"
  default     = ""
}

variable "name" {
  type        = string
  description = "Name of the application"
  default     = ""
}

variable "tags" {
  type        = map(string)
  description = "Additional tags (_e.g._ { BusinessUnit : ABC })"
  default     = {}
}

variable "label" {
  type        = string
  description = "Label for SG names"
  default     = ""
}

variable "vpc_id" {
  type        = string
  description = "VPC ID"
  default     = ""
}

variable "ecs_ports" {
  type        = list(string)
  description = "Create separate SG for each given port"
  default     = []
}

variable "enabled" {
  type        = bool
  description = "Defines if whether resources in this module will be created"
  default     = false
}

variable "ecs_enabled" {
  type        = bool
  description = "Defines if ECS related resources will be created"
  default     = false
}

variable "alb_enabled" {
  type        = bool
  description = "Defines if ALB related resources will be created"
  default     = false
}


variable "ssm_arns" {
  type    = list(string)
  default = []
}

variable "kms_arns" {
  type    = list(string)
  default = []
}