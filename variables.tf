# Define your variables in here.
variable "tfc_oauth_token_id" {
  type        = string
  default     = ""
  description = "TFC/E VCS privider id"
}

variable "organization" {
  type        = string
  default     = "yulei"
  description = "Name of TFC/E organization"
}
