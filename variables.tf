variable "aws_key_name" {
  description = "SSH keypair name for the VPN instance"
  # default = "mykey"
}

variable "vpc_id" {
  type        = string
  description = "Which VPC VPN server will be created in"
}

variable "public_subnet_id" {
  type        = string
  description = "One of the public subnet id for the VPN instance"
}

variable "instance_type" {
  description = "Instance type for VPN Box"
  type        = string
  default     = "t2.small"
}

variable "tags" {
  description = "A map of tags to add to all resources"
  type        = map(any)
  default     = {}
}

variable "resource_name_prefix" {
  description = "All the resources will be prefixed with the value of this variable"
  default     = "pritunl"
}

variable "internal_cidrs" {
  description = "[List] IP CIDRs to whitelist in the pritunl's security group"
  type        = list(string)
  default     = []
}

variable "volume_size" {
  type        = number
  description = "ec2 volume size"
  default     = 20
}


variable "iam_instance_profile" {
  type = string
  description = "iam_instance_profile - must exist before!"
  default = null
}

variable "additional_security_group" {
  type = list
  description = "Additional security (created outside of module) group(s)"
  default = []
}