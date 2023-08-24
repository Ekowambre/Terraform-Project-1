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



variable "Availibilty_zone_1" {
  description = "public subnet availibity zone 1"
  type        = string
  default     = "eu-west-2a"
}


variable "Availibilty_zone_2" {
  description = "public subnet availibity zone 2"
  type        = string
  default     = "eu-west-2b"
}

variable "Availibilty_zone_3" {
  description = "private subnet availibity zone 1"
  type        = string
  default     = "eu-west-2c"
}

variable "Availibilty_zone_4" {
  description = "private subnet availibity zone 2"
  type        = string
  default     = "eu-west-2a"
}