variable "bucket_names" {
  type = list(string)
  default = ["rajkumar-terraform-bucket1-2026", "rajkumar-terraform-bucket2-2026",
   ]
}
variable "environment" {
  description = "Environment tag for the buckets"
  type        = string
  default     = "dev"
}
