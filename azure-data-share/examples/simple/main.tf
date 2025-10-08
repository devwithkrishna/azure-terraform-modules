module "data_share" {
  source = "../../"   # points to the module root (azure-data-share)

  resource_group_name     = var.resource_group_name
  location                = var.location
  data_share_name         = var.data_share_name

  environment             = var.environment
  application_name        = var.application_name
  temporary               = var.temporary

}
