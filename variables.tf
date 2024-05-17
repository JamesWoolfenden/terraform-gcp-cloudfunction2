

variable "location" {
  type = string
}

variable "project" {
  type = string
}

variable "source_zip_path" {
  type = string
}

variable "job_name" {
  type    = string
  default = "invoke-btdelete"
}

variable "schedule" {
  type    = string
  default = "0 0 * * *" # every day at midnight
}

variable "function_name" {
  type = string
}


variable "time_zone" {
  type    = string
  default = "America/Los_Angeles"
}

variable "key_id" {
  type = string
}

variable "env_vars" {
  type = map(any)
}

variable "body" {
  type = string
}


variable "retry_config" {
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
}

variable "bucketname" {
  type = string
}

variable "serviceaccount_email" {
  type = string
}