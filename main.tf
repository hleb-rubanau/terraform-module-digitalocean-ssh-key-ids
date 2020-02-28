variable "keys" {
  type    = list(string)
  default = []
}

data "digitalocean_ssh_key" "selected" {
  for_each = toset(var.keys)
  name     = each.value
}

output "ssh_key_ids" {
  value = data.digitalocean_ssh_key.selected
}
