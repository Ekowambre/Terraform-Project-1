variable "region" {
  description = "VPC rgion"
  type        = string
  default     = "eu-west-2"
}


variable "vpc_cidr" {
  description = "VPC cidr block"
  type        = string
  default     = "10.0.0.0/16"
}

variable "Public_subnet_1_cidr" {
  description = "Public-subnet-1 cidr block"
  type        = string
  default     = "10.0.1.0/24"
}


variable "Private_subnet_1_cidr" {
  description = "Public subnet 1 cidr block"
  type        = string
  default     = "10.0.3.0/24"
}
