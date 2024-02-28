# Atlas Organization ID
variable "atlas_org_id" {
  type        = string
  description = "Atlas Organization ID"
}
# Atlas Organization ID
variable "project_id" {
  description = "Atlas Organization ID"
  #default     = "FIXME"
}
# Atlas Project Name
variable "atlas_project_name" {
  description = "Atlas Project Name"
}

# Atlas Project Environment
variable "environment" {
  type        = string
  description = "The environment to be built"
}
# MongoDB Version
variable "mongodb_version" {
  type        = string
  description = "MongoDB Version"
}

#data dog region
variable "region" {
  type    = string
  default = "US"
}

#datadog api key
variable "datadog_api_key" {
  type        = string
  default     = "4693bace2ce29472b0953c6246cfd203"
  description = "API comunicação datadog stg"
}

