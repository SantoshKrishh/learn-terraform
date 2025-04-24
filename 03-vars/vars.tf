variable "sample" {
    default = 100
}

variable "name" {
  default = "Hello, World!"
}

output "test" {
    value = var.sample
}

output "testing" {
    value = var.name
}

output "sample-extra" {
    value = "value of sample" - var.sample
    
}