variable "project_name" {
  description = "The name of the project"
  type        = string

}

variable "environment" {
  description = "The environment (e.g., dev, prod)"
  type        = string

}

variable "k8s_version" {
  description = "The Kubernetes version for the EKS cluster"
  type        = string
  default     = "1.33"

}

variable "private_subnets" {
  description = "List of private subnet IDs"
  type        = list(string)

}

variable "endpoint_private_access" {
  description = "Enable private access to the EKS API server endpoint"
  type        = bool
  default     = true

}

variable "cluster_log_types" {
  description = "Map of log types to enable/disable"
  type        = map(bool)
  default = {
    api               = true
    audit             = true
    authenticator     = true
    controllerManager = true
    scheduler         = true
  }
}

variable "zonal_shift_enabled" {
  description = "Enable zonal shift for the EKS cluster"
  type        = bool
  default     = false

}