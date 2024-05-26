<!-- BEGIN_TF_DOCS -->
# Resumo
Este projeto é um exemplo de uso do Terraform para estabelecer uma conexão com a API do VMware vSphere. Utilizando o provider Terraform para vSphere, o projeto facilita a automação e o gerenciamento de infraestrutura virtualizada. Inclui configurações básicas e scripts necessários para a implementação. É adequado para administradores de sistemas e engenheiros de DevOps que buscam integrar o Terraform em seus ambientes de VMware. A documentação acompanha detalhamento das etapas de configuração e uso.

## Requirements

- Terraform
- OpenTofu
- Vsphere API
  
## Providers

| Name | Version |
|------|---------|
| <a name="provider_vsphere"></a> [vsphere](#provider\_vsphere) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [vsphere_virtual_machine.virtualmachine](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/resources/virtual_machine) | resource |
| [vsphere_compute_cluster.cluster](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/compute_cluster) | data source |
| [vsphere_datacenter.datacenter](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datacenter) | data source |
| [vsphere_datastore.datastore](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/datastore) | data source |
| [vsphere_network.networking](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/network) | data source |
| [vsphere_resource_pool.default](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/resource_pool) | data source |
| [vsphere_virtual_machine.template](https://registry.terraform.io/providers/hashicorp/vsphere/latest/docs/data-sources/virtual_machine) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster"></a> [cluster](#input\_cluster) | Defina o cluster. | `string` | `"Cluster-1"` | no |
| <a name="input_data_center"></a> [data\_center](#input\_data\_center) | Defina o data center. | `string` | `"Datacenter"` | no |
| <a name="input_data_store"></a> [data\_store](#input\_data\_store) | Defina o datastore. | `string` | `"Datastore-1"` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | Defina o tamanho do disco em GB. EX: 50 | `number` | `60` | no |
| <a name="input_dns_server_list"></a> [dns\_server\_list](#input\_dns\_server\_list) | Defina o dns. | `list(string)` | <pre>[<br>  "8.8.8.8",<br>  "1.1.1.1"<br>]</pre> | no |
| <a name="input_domain"></a> [domain](#input\_domain) | Defina o dominio. EX: teste.local | `string` | `"teste.local"` | no |
| <a name="input_efi_secure_boot_enabled"></a> [efi\_secure\_boot\_enabled](#input\_efi\_secure\_boot\_enabled) | Defina o modo de boot. EX: true | `string` | `"true"` | no |
| <a name="input_firmware"></a> [firmware](#input\_firmware) | Defina o fimware. | `string` | `"efi"` | no |
| <a name="input_gateway"></a> [gateway](#input\_gateway) | Defina o gateway. | `string` | `"192.168.1.1"` | no |
| <a name="input_ipv4_netmask"></a> [ipv4\_netmask](#input\_ipv4\_netmask) | Defina o valor do netmask. | `number` | `24` | no |
| <a name="input_mgmt_lan"></a> [mgmt\_lan](#input\_mgmt\_lan) | Defina a lan. | `string` | `"LAN"` | no |
| <a name="input_net_adapter_type"></a> [net\_adapter\_type](#input\_net\_adapter\_type) | Defina o tipo de adaptador. EX: e1000e, vmxnet3 | `string` | `"vmxnet3"` | no |
| <a name="input_num_cpus"></a> [num\_cpus](#input\_num\_cpus) | Defina o número de vCPU. EX: 2 | `number` | `1` | no |
| <a name="input_num_mem"></a> [num\_mem](#input\_num\_mem) | Defina o número de RAM. EX: 1024, 2048, 4096 | `number` | `4096` | no |
| <a name="input_password"></a> [password](#input\_password) | Defina a senha de usuário do Vsphere. EX: VMwareTeste! | `string` | `"password"` | no |
| <a name="input_thin_provisioned"></a> [thin\_provisioned](#input\_thin\_provisioned) | Defina o thin\_provisioned. EX: true | `string` | `"true"` | no |
| <a name="input_username"></a> [username](#input\_username) | Defina o nome de usuario com acesso ao Vsphere. | `string` | `"username"` | no |
| <a name="input_vm"></a> [vm](#input\_vm) | Defina uma ou mais maquinas virtuais. EX: vm1, vm2, vm3, vm4, vm5 | `map` | <pre>{<br>  "vm1": {<br>    "hostname": "vm1",<br>    "ipv4_address": "",<br>    "name": "VM1-TESTE"<br>  },<br>  "vm2": {<br>    "hostname": "vm2",<br>    "ipv4_address": "",<br>    "name": "VM2-TESTE"<br>  },<br>  "vm3": {<br>    "hostname": "vm3",<br>    "ipv4_address": "",<br>    "name": "VM3-TESTE"<br>  }<br>}</pre> | no |
| <a name="input_vm_template"></a> [vm\_template](#input\_vm\_template) | Defina o template. | `string` | `"templates"` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->
