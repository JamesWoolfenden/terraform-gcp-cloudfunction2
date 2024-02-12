

variable "location" {
  type = string
}

variable "project" {
  type = string
}

variable "sourcezippath" {
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
  default = "America/SAN_FRANCISCO"
}
