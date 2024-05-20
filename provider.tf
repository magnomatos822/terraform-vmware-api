provider "vsphere" {
  # SSH credentials
  vsphere_server       = "10.10.110.7"
  user                 = var.username
  password             = var.password
  allow_unverified_ssl = true
  # api_timeout = "10"
}
