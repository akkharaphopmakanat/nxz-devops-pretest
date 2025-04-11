variable "deployment_name" {
  description = "Name of the Kubernetes deployment"
  type        = string
  default     = "nxz-app"
}

variable "service_name" {
  description = "Name of the Kubernetes service"
  type        = string
  default     = "nxz-service"
}