variable "instance_type" {
  type = string
}

variable "access_key"{
    type = string
}

variable "screat_key"{
    type = string
}

variable "region" {
    type = string
}

variable "ports"{
    type = list (number)
}

variable "ami" {
  type = string
}

# Define the SSH key name
variable "ssh_key_name" {
  default = "key_tf"  # Change this to your actual SSH key name in AWS
}

