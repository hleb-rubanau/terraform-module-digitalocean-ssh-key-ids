variable "keys" {
  type    = list(string)
  default = []
}

data "digitalocean_ssh_key" "selected" {
  for_each = toset(var.keys)
  name     = each.value
}

output "data" {
  value = data.digitalocean_ssh_key.selected
}
