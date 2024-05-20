
variable "data_center" {
  default     = "Datacenter"
  description = "Defina o data center."
  validation {
    condition     = length(var.data_center) > 0
    error_message = "O nome do data center deve ser informado."
  }
}
variable "cluster" {
  default     = "Cluster-1"
  description = "Defina o cluster."
  validation {
    condition     = length(var.cluster) > 0
    error_message = "O nome do cluster deve ser informado."
  }
}
variable "data_store" {
  default     = "Datastore-1"
  description = "Defina o datastore."
  validation {
    condition     = length(var.data_store) > 0
    error_message = "O nome do datastore deve ser informado."
  }
}
variable "mgmt_lan" {
  default     = "LAN"
  description = "Defina a lan."
  validation {
    condition     = contains(["LAN"], var.mgmt_lan)
    error_message = "O valor da lan deve ser informado."
  }
}
variable "net_adapter_type" {
  default     = "vmxnet3"
  description = "Defina o tipo de adaptador. EX: e1000e, vmxnet3"
  validation {
    condition     = contains(["e1000e", "vmxnet3"], var.net_adapter_type)
    error_message = "O valor do tipo de adaptador deve ser informado."
  }
}

variable "vm_template" {
  default     = "templates"
  description = "Defina o template."
  validation {
    condition     = length(var.vm_template) > 0
    error_message = "O nome do template deve ser informado."
  }
}

variable "firmware" {
  default     = "efi"
  description = "Defina o fimware."

  validation {
    condition     = contains(["efi", "bios"], var.firmware)
    error_message = "O valor do firmware deve ser efi or bios."
  }
}
variable "efi_secure_boot_enabled" {
  default     = "true"
  description = "Defina o modo de boot. EX: true"
  validation {
    condition     = contains(["true", "false"], var.efi_secure_boot_enabled)
    error_message = "O valor do modo de boot deve ser true or false."
  }
}

variable "username" {
  default     = "username"
  description = "Defina o nome de usuario com acesso ao Vsphere."
  validation {
    condition     = length(var.username) > 0
    error_message = "O nome de usuario do Vsphere deve ser informado."
  }
}
variable "password" {
  default     = "password"
  description = "Defina a senha de usuário do Vsphere. EX: VMwareTeste!"
  validation {
    condition     = length(var.password) > 0
    error_message = "A senha do usuário do Vsphere deve ser informada."
  }
}
variable "disk_size" {
  default     = 60
  description = "Defina o tamanho do disco em GB. EX: 50"
  validation {
    condition     = var.disk_size > 0
    error_message = "O tamanho do disco deve ser informado."
  }
}
variable "thin_provisioned" {
  default     = "true"
  description = "Defina o thin_provisioned. EX: true"
  validation {
    condition     = contains(["true", "false"], var.thin_provisioned)
    error_message = "O valor do thin_provisioned deve ser true or false."
  }
}
variable "num_cpus" {
  default     = 1
  description = "Defina o número de vCPU. EX: 2"
  validation {
    condition     = var.num_cpus > 0
    error_message = "O número de vCPU deve ser informado."
  }
}
variable "num_mem" {
  default     = 4096
  description = "Defina o número de RAM. EX: 1024, 2048, 4096"
  validation {
    condition     = var.num_mem > 0
    error_message = "O número de RAM deve ser informado."
  }
}
variable "domain" {
  default     = "teste.local"
  description = "Defina o dominio. EX: teste.local"
  validation {
    condition     = length(var.domain) > 0
    error_message = "O dominio deve ser informado."
  }
}
variable "gateway" {
  default     = "192.168.1.1"
  description = "Defina o gateway."
  validation {
    condition     = length(var.gateway) > 0
    error_message = "O gateway deve ser informado."
  }
}

variable "vm" {
  default = {
    "vm1" = {
      ipv4_address = ""
      name         = "VM1-TESTE"
      hostname     = "vm1"
    }
    "vm2" = {
      ipv4_address = ""
      name         = "VM2-TESTE"
      hostname     = "vm2"
    }
    "vm3" = {
      ipv4_address = ""
      name         = "VM3-TESTE"
      hostname     = "vm3"
    }
  }
  description = "Defina uma ou mais maquinas virtuais. EX: vm1, vm2, vm3, vm4, vm5"
  validation {
    condition     = length(var.vm) > 0
    error_message = "Defina pelo menos uma maquina virtual."
  }
}

variable "ipv4_netmask" {
  default     = 24
  description = "Defina o valor do netmask."
  validation {
    condition     = var.ipv4_netmask > 0
    error_message = "O valor do netmask deve ser informado."
  }
}

variable "dns_server_list" {
  default     = ["8.8.8.8", "1.1.1.1"]
  type        = list(string)
  description = "Defina o dns."
  validation {
    condition     = length(var.dns_server_list) > 0
    error_message = "O dns deve ser informado."
  }
}
