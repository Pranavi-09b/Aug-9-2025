variable "public-cidr-1" {
    default = "10.0.1.0/24"
    type = string
    description = "public subnet 1 cidr range"

}
variable "public-cidr-2" {
    default = "10.0.2.0/24"
    type = string
    description = "public subnet 2 cidr range"

}
variable "private-cidr-1"{
    default = "10.0.3.0/24"
    type = string
    description = "private subnet cidr range"
}