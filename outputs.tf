output "instance_id" {
  description = "name of created instances. "
  value = [
    oci_core_instance.instance[0].display_name,
    oci_core_instance.instance[1].display_name,
  ]
}

output "public_ip" {
  description = "Public IPs of created instances. "
  value = [
    oci_core_instance.instance[0].public_ip,
    oci_core_instance.instance[1].public_ip,
  ]
}
