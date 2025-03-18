data "template_file" "user_data" {
  # base64_encode = true
  template = file("./cloudinit.conf")
}

data "template_cloudinit_config" "config" {
  gzip          = true
  base64_encode = true

  # Main cloud-config configuration file.
  part {
    content_type = "text/cloud-config"
    content      = data.template_file.user_data.rendered
  }
}