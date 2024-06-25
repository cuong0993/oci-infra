# oci provider config
variable "tenancy_ocid" {
  type    = string
  default = "ocid1.tenancy.oc1..aaaaaaaab656nryvuy6j4glij5pgqi5vttw6fgca4kgflwihayzaeih4dg3a"
}
variable "user_ocid" {
  type    = string
  default = "ocid1.user.oc1..aaaaaaaap37hodjm2ddaay6lxycmpjxmxqlzkmrxfnu7wxeevp72holdptaq"
}
variable "fingerprint" {
  type    = string
  default = "ba:c6:27:bf:50:f8:05:a5:2c:36:84:fe:8c:fd:59:fb"
}
variable "private_key_path" {
  type    = string
  default = "private_key.pem"
}
variable "region" {
  type    = string
  default = "ap-singapore-1"
}
variable "parent_compartment_id" {
  type    = string
  default = "ocid1.tenancy.oc1..aaaaaaaab656nryvuy6j4glij5pgqi5vttw6fgca4kgflwihayzaeih4dg3a"
}
variable "compartment_name" {
  type = string
}
variable "compartment_description" {
  type = string
}

# network config
variable "internet_gateway_display_name" {
  type    = string
  default = "Internet Gateway vcn"
}
variable "vcn_display_name" {
  type    = string
  default = "vcn"
}
variable "vcn_dns_label" {
  type    = string
  default = "vcn"
}
variable "vcn_cidr_block" {
  type    = string
  default = "10.0.0.0/16"
}
variable "subnet_display_name" {
  type    = string
  default = "public-subnet"
}
variable "subnet_dns_label" {
  type    = string
  default = "subnet"
}
variable "subnet_cidr_block" {
  type    = string
  default = "10.0.0.0/24"
}

variable "dhcp_options_display_name" {
  type    = string
  default = "Default DHCP Options for vcn"
}

variable "security_list_display_name" {
  type    = string
  default = "Default Security List for vcn"
}
variable "security_list_egress_security_rules_destination" {
  type    = string
  default = "0.0.0.0/0"
}
variable "security_list_egress_security_rules_destination_type" {
  type    = string
  default = "CIDR_BLOCK"
}
variable "security_list_egress_security_rules_protocol" {
  type    = string
  default = "all"
}
variable "security_list_egress_security_rules_stateless" {
  type    = bool
  default = false
}

variable "security_list_ingress_security_rules_destination" {
  type    = string
  default = "0.0.0.0/0"
}

# machine configs
variable "number_of_instances" {
  type    = number
  default = 4
}
variable "ssh_key_path" {
  type    = string
  default = "id_rsa.pub"
}
variable "instance_shape" {
  type = string
}

# instance name
variable "instance_display_name" {
  type    = string
  default = "instance"
}
variable "memory_in_gbs" {
  type = string
}
variable "ocpus" {
  type = string
}
variable "source_id" {
  type = string
}
variable "counter_offset" {
  type    = number
  default = 0
}
