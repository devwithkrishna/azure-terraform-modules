locals {
  computed_start_time = var.snapshot_start_time != null ? var.snapshot_start_time : timeadd(timestamp(), "1h")
}
