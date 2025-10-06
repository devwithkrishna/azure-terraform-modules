# Azure Terraform Modules

This repository contains Terraform modules designed to help manage and automate the provisioning of Azure cloud resources. Each module is crafted to follow best practices and make it easier to create, configure, and manage specific Azure services in a reusable manner.

## Report an Issue

If you encounter any issues, please report them on the [Issues page](https://github.com/devwithkrishna/azure-terraform-modules/issues/new).
## Available Modules

* **api-management**: Located in `api-management/`
* **azure-data-share**: Located in `azure-data-share/`
* **container-registry**: Located in `container-registry/`
* **cosmosdb-mongo-vcore**: Located in `cosmosdb-mongo-vcore/`
* **data-factory**: Located in `data-factory/`
* **dns-zone**: Located in `dns-zone/`
* **keyvault-nonprod**: Located in `keyvault-nonprod/`
* **keyvault-with-private-endpoint**: Located in `keyvault-with-private-endpoint/`
* **kubernetes-cluster**: Located in `kubernetes-cluster/`
* **linux-virtual-machine**: Located in `linux-virtual-machine/`
* **log-analytics-workspace**: Located in `log-analytics-workspace/`
* **storage-account**: Located in `storage-account/`
* **user-assigned-managed-identity**: Located in `user-assigned-managed-identity/`
* **virtual-network**: Located in `virtual-network/`
* **vmss-linux**: Located in `vmss-linux/`

## Project Directory Structure
```
.
├── api-management
│   ├── README.md
│   ├── apim.tf
│   ├── output.tf
│   └── variables.tf
├── azure-data-share
│   ├── README.md
│   ├── datashare.tf
│   ├── outputs.tf
│   ├── providers.tf
│   └── variables.tf
├── container-registry
│   ├── README.md
│   ├── acr.tf
│   ├── outputs.tf
│   ├── providers.tf
│   └── variables.tf
├── cosmosdb-mongo-vcore
│   ├── README.md
│   ├── credentials.tf
│   ├── mongo.tf
│   ├── output.tf
│   ├── providers.tf
│   └── variables.tf
├── data-factory
│   ├── README.md
│   ├── datafactory.tf
│   ├── output.tf
│   ├── providers.tf
│   └── variables.tf
├── dns-zone
│   ├── README.md
│   ├── dnszone.tf
│   ├── output.tf
│   ├── providers.tf
│   └── variables.tf
├── keyvault-nonprod
│   ├── README.md
│   ├── data.tf
│   ├── keyvault.tf
│   ├── output.tf
│   ├── providers.tf
│   └── variables.tf
├── keyvault-with-private-endpoint
│   ├── README.md
│   ├── data.tf
│   ├── keyvault.tf
│   ├── output.tf
│   ├── providers.tf
│   └── variables.tf
├── kubernetes-cluster
│   ├── README.md
│   ├── data.tf
│   ├── kubernetes.tf
│   ├── output.tf
│   ├── providers.tf
│   └── variables.tf
├── linux-virtual-machine
│   ├── README.md
│   ├── cloudinit.conf
│   ├── cloudinit.tf
│   ├── outputs.tf
│   ├── providers.tf
│   ├── random.tf
│   ├── variables.tf
│   └── vm.tf
├── log-analytics-workspace
│   ├── README.md
│   ├── loganalytics.tf
│   ├── output.tf
│   ├── providers.tf
│   └── variables.tf
├── storage-account
│   ├── README.md
│   ├── output.tf
│   ├── providers.tf
│   ├── storageaccount.tf
│   └── variables.tf
├── user-assigned-managed-identity
│   ├── README.md
│   ├── data.tf
│   ├── locals.tf
│   ├── managed-identity.tf
│   ├── output.tf
│   ├── providers.tf
│   └── variables.tf
├── virtual-network
│   ├── README.md
│   ├── nsg.tf
│   ├── output.tf
│   ├── providers.tf
│   ├── variables.tf
│   └── vnet.tf
├── vmss-linux
│   ├── README.md
│   ├── cloudinit.conf
│   ├── data.tf
│   ├── load_balancer.tf
│   ├── outputs.tf
│   ├── providers.tf
│   ├── variables.tf
│   └── vmss.tf
└── README.md

16 directories, 88 files
```
