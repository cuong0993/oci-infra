resource "oci_core_vcn" "the_vcn" {
  cidr_block     = var.vcn_cidr_block
  compartment_id = oci_identity_compartment.compartment.id
  display_name   = var.vcn_display_name
  dns_label      = var.vcn_dns_label
}

resource "oci_core_subnet" "the_subnet" {
  cidr_block        = var.subnet_cidr_block
  compartment_id    = oci_identity_compartment.compartment.id
  display_name      = var.subnet_display_name
  dns_label         = var.subnet_dns_label
  route_table_id    = oci_core_vcn.the_vcn.default_route_table_id
  vcn_id            = oci_core_vcn.the_vcn.id
  security_list_ids = toset([oci_core_security_list.the_security_list.id])
}

resource "oci_core_internet_gateway" "the_internet_gateway" {
  compartment_id = oci_identity_compartment.compartment.id
  display_name   = var.internet_gateway_display_name
  enabled        = "true"
  vcn_id         = oci_core_vcn.the_vcn.id
}

resource "oci_core_default_route_table" "the_default_route_table" {
  route_rules {
    destination       = "0.0.0.0/0"
    destination_type  = "CIDR_BLOCK"
    network_entity_id = oci_core_internet_gateway.the_internet_gateway.id
  }
  manage_default_resource_id = oci_core_vcn.the_vcn.default_route_table_id
}

resource "oci_core_default_dhcp_options" "the_default_dhcp_options" {
  manage_default_resource_id = oci_core_vcn.the_vcn.default_dhcp_options_id

  display_name = var.dhcp_options_display_name

  options {
    type        = "DomainNameServer"
    server_type = "VcnLocalPlusInternet"
  }
}

resource "oci_core_security_list" "the_security_list" {
  compartment_id = oci_identity_compartment.compartment.id
  vcn_id         = oci_core_vcn.the_vcn.id

  display_name = var.security_list_display_name

  egress_security_rules {
    destination      = var.security_list_egress_security_rules_destination
    destination_type = var.security_list_egress_security_rules_destination_type
    protocol         = var.security_list_egress_security_rules_protocol
    stateless        = var.security_list_egress_security_rules_stateless
  }

  # Open SSH port
  ingress_security_rules {
    stateless   = false
    source      = var.security_list_ingress_security_rules_destination
    source_type = "CIDR_BLOCK"

    # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml TCP is 6
    protocol = "6"
    tcp_options {
      min = 22
      max = 22
    }
  }

  # Open MySQL port
  ingress_security_rules {
    stateless   = true
    source      = var.security_list_ingress_security_rules_destination
    source_type = "CIDR_BLOCK"

    # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml TCP is 6
    protocol = "6"
    tcp_options {
      min = 3306
      max = 3306
    }
  }
}
