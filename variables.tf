variable "instance_name" {}
variable "security_group_name" {}
variable "key_name" {
    description = "Allready available Key pair name:"
    type = string
}
variable "private_key_location_in_pem" {
    description = "Location of the key pair & in .pem format:"
    type = string
}
variable "bucket_name" {}
variable "image_name" {
    description = "Object name with it's extension"
    type = string
}
variable "var1" {
    default = "S3-"
}