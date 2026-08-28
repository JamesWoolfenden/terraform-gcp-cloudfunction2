# holden:ignore:HLD_TF_027

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
  sensitive   = true
  validation {
    condition     = length(trimspace(var.key_id)) > 0
    error_message = "The key_id must not be empty."
  }
}

variable "env_vars" {
  description = "Environment variables for the Cloud Function."
  type        = map(any)
  validation {
    condition     = alltrue([for k in keys(var.env_vars) : can(regex("^[A-Za-z_][A-Za-z0-9_]*$", k))])
    error_message = "Each env_vars key must be a valid environment variable name (letters, digits, underscore; must not start with a digit)."
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
    max_retry_duration   = "600s"
    min_backoff_duration = "5s"
    retry_count          = 3
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
  description = "Email address of the service account the Cloud Function runs as."
  type        = string
  validation {
    condition     = length(trimspace(var.serviceaccount_email)) > 0
    error_message = "The serviceaccount_email must not be empty."
  }
}

variable "invoker_serviceaccount_email" {
  description = "Email address of the service account authorized to invoke the Cloud Function and used as the Cloud Scheduler OIDC caller identity. Keep this distinct from serviceaccount_email so the function's runtime identity cannot also trigger itself."
  type        = string
  validation {
    condition     = length(trimspace(var.invoker_serviceaccount_email)) > 0
    error_message = "The invoker_serviceaccount_email must not be empty."
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
    condition     = alltrue([for s in var.secrets : length(trimspace(s.key)) > 0 && length(trimspace(s.secret)) > 0 && length(trimspace(s.version)) > 0])
    error_message = "Each secret's key, secret, and version must be non-empty."
  }
}

variable "min_instance_count" {
  description = "Minimum number of function instances to keep warm."
  type        = number
  default     = 0
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
    condition     = var.max_instance_count >= 1
    error_message = "The max_instance_count must be at least 1."
  }
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
    condition     = var.vpc_connector == trimspace(var.vpc_connector)
    error_message = "The vpc_connector must not have leading or trailing whitespace."
  }
}

variable "kms_key_name" {
  description = "KMS key name for encryption."
  type        = string
  sensitive   = true
  validation {
    condition     = length(trimspace(var.kms_key_name)) > 0
    error_message = "The kms_key_name must not be empty."
  }
}

variable "function_viewers" {
  type        = list(string)
  description = "Principals granted roles/cloudfunctions.viewer on the function, authoritatively for that role. Empty to create no binding"
  default     = []

  validation {
    condition     = !anytrue([for m in var.function_viewers : contains(["allUsers", "allAuthenticatedUsers"], m)])
    error_message = "var.function_viewers must not contain allUsers or allAuthenticatedUsers"
  }
}

variable "run_invokers" {
  type        = list(string)
  description = "Principals granted roles/run.invoker on the function's underlying Cloud Run service, authoritatively for that role. Empty to create no binding"
  default     = []

  validation {
    condition     = !anytrue([for m in var.run_invokers : contains(["allUsers", "allAuthenticatedUsers"], m)])
    error_message = "var.run_invokers must not contain allUsers or allAuthenticatedUsers"
  }
}
