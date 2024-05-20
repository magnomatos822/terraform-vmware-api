/**
 * # Main title
 *
 * Everything in this comment block will get extracted.
 *
 * You can put simple text or complete Markdown content
 * here. Subsequently if you want to render AsciiDoc format
 * you can put AsciiDoc compatible content in this comment
 * block.
 */

# Build New VM
data "vsphere_datacenter" "datacenter" {
  name = var.data_center
}
data "vsphere_datastore" "datastore" {
  name          = var.data_store
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.vm_template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.cluster
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_resource_pool" "default" {
  name          = format("%s%s", data.vsphere_compute_cluster.cluster.name, "/Resources")
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "networking" {
  name          = var.mgmt_lan
  datacenter_id = data.vsphere_datacenter.datacenter.id
}


resource "vsphere_virtual_machine" "virtualmachine" {
  for_each = var.vm
  # count            = var.vm_count
  name             = "${each.value.name}-${each.value.ipv4_address}"
  resource_pool_id = data.vsphere_resource_pool.default.id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = var.num_cpus
  memory           = var.num_mem
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  # guest_id                = var.guest_id
  firmware = var.firmware
  # efi_secure_boot_enabled = false
  # scsi_type        = "lsilogic"

  # wait_for_guest_net_timeout = 0

  # wait_for_guest_ip_timeout = 0

  network_interface {
    network_id   = data.vsphere_network.networking.id
    adapter_type = var.net_adapter_type
  }

  # cdrom {
  #   datastore_id  = "data.vsphere_datastore.data_store.id"
  #   path          = "[DE800231803870-01-01-service-datastore1] images/ISOs/debian-12.5.0-amd64-netinst.iso"
  #   client_device = true
  # }
  clone {
    template_uuid = data.vsphere_virtual_machine.template.id

    customize {
      linux_options {
        host_name = each.value.hostname
        domain    = var.domain
      }
      network_interface {
        ipv4_address = each.value.ipv4_address
        ipv4_netmask = var.ipv4_netmask
      }
      ipv4_gateway    = var.gateway
      dns_server_list = var.dns_server_list
    }
  }
  disk {
    label            = "disk0"
    size             = var.disk_size
    thin_provisioned = var.thin_provisioned
  }
}

