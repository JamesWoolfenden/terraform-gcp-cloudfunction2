

variable "location" {
  description = "GCP region to deploy resources."
  type        = string
  validation {
    condition     = length(trimspace(var.location)) > 0
    error_message = "The location must not be empty."
  }
}

variable "project" {
  description = "GCP project ID."
  type        = string
  validation {
    condition     = length(trimspace(var.project)) > 0
    error_message = "The project must not be empty."
  }
}

variable "source_zip_path" {
  description = "Local path to the zipped source archive."
  type        = string
  validation {
    condition     = length(trimspace(var.source_zip_path)) > 0
    error_message = "The source_zip_path must not be empty."
  }
}

variable "job_name" {
  description = "Name of the scheduled Cloud Scheduler job."
  type        = string
  default     = "invoke-btdelete"
  validation {
    condition     = length(trimspace(var.job_name)) > 0
    error_message = "The job_name must not be empty."
  }
}

variable "schedule" {
  description = "Cron schedule for the Cloud Scheduler job."
  type        = string
  default     = "0 0 * * *" # every day at midnight
  validation {
    condition     = length(trimspace(var.schedule)) > 0
    error_message = "The schedule must not be empty."
  }
}

variable "function_name" {
  description = "Name of the Cloud Function to deploy."
  type        = string
  validation {
    condition     = length(trimspace(var.function_name)) > 0
    error_message = "The function_name must not be empty."
  }
}

variable "time_zone" {
  description = "Time zone for the scheduler."
  type        = string
  default     = "America/Los_Angeles"
  validation {
    condition     = length(trimspace(var.time_zone)) > 0
    error_message = "The time_zone must not be empty."
  }
}

variable "key_id" {
  description = "KMS key identifier used for encryption or access."
  type        = string
  validation {
    condition     = length(trimspace(var.key_id)) > 0
    error_message = "The key_id must not be empty."
  }
}

variable "env_vars" {
  description = "Environment variables for the Cloud Function."
  type        = map(any)
  validation {
    condition     = length(keys(var.env_vars)) >= 0
    error_message = "The env_vars must be a valid map."
  }
}

variable "body" {
  description = "Request body for the Cloud Function invocation."
  type        = string
  validation {
    condition     = length(trimspace(var.body)) > 0
    error_message = "The body must not be empty."
  }
}

variable "retry_config" {
  description = "Retry configuration for Cloud Scheduler."
  type = object({
    max_backoff_duration = string
    max_doublings        = number
    max_retry_duration   = string
    min_backoff_duration = string
    retry_count          = number
  })

  default = {
    max_backoff_duration = "3600s"
    max_doublings        = 5
    max_retry_duration   = "0s"
    min_backoff_duration = "5s"
    retry_count          = 0
  }

  validation {
    condition     = length(trimspace(var.retry_config.max_backoff_duration)) > 0 && length(trimspace(var.retry_config.max_retry_duration)) > 0 && length(trimspace(var.retry_config.min_backoff_duration)) > 0 && var.retry_config.max_doublings >= 0 && var.retry_config.retry_count >= 0
    error_message = "The retry_config object must contain valid duration fields and non-negative counts."
  }
}

variable "bucketname" {
  description = "Name of the storage bucket used by the function."
  type        = string
  validation {
    condition     = length(trimspace(var.bucketname)) > 0
    error_message = "The bucketname must not be empty."
  }
}

variable "serviceaccount_email" {
  description = "Email address of the service account for the function."
  type        = string
  validation {
    condition     = length(trimspace(var.serviceaccount_email)) > 0
    error_message = "The serviceaccount_email must not be empty."
  }
}
variable "entry_point" {
  description = "Entry point symbol for the Cloud Function."
  type        = string
  validation {
    condition     = length(trimspace(var.entry_point)) > 0
    error_message = "The entry_point must not be empty."
  }
}

variable "runtime" {
  description = "Runtime environment for the Cloud Function."
  type        = string
  default     = "go122"
  validation {
    condition     = length(trimspace(var.runtime)) > 0
    error_message = "The runtime must not be empty."
  }
}

variable "secrets" {
  description = "Secrets to expose to the Cloud Function."
  type = list(object({
    key     = string
    secret  = string
    version = string
  }))
  sensitive = true
  validation {
    condition     = length(var.secrets) >= 0
    error_message = "The secrets must be a list of secret objects."
  }
}

variable "min_instance_count" {
  description = "Minimum number of function instances to keep warm."
  type        = number
  default     = 1
  validation {
    condition     = var.min_instance_count >= 0
    error_message = "The min_instance_count must be zero or greater."
  }
}

variable "available_memory" {
  description = "Amount of memory allocated to the Cloud Function."
  type        = string
  default     = "256M"
  validation {
    condition     = length(trimspace(var.available_memory)) > 0
    error_message = "The available_memory must not be empty."
  }
}

variable "timeout_seconds" {
  description = "Maximum function execution time in seconds."
  type        = number
  default     = 60
  validation {
    condition     = var.timeout_seconds > 0
    error_message = "The timeout_seconds must be greater than zero."
  }
}

variable "max_instance_count" {
  description = "Maximum number of function instances."
  type        = number
  default     = 1
  validation {
    condition     = var.max_instance_count >= var.min_instance_count
    error_message = "The max_instance_count must be greater than or equal to min_instance_count."
  }
}

variable "vpc_connector" {
  description = "Name of the VPC connector for the Cloud Function."
  type        = string
  default     = ""
  validation {
    condition     = length(trimspace(var.vpc_connector)) >= 0
    error_message = "The vpc_connector must not be empty if specified."
  }
}
