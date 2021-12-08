variable "k3s_version" {
  description = "The K3s version to use"
  type        = string
  default     = "v1.21.6-k3s1"
}

variable "server_ports" {
  description = "Port mappings of the server container."
  default     = []

  type = set(object({
    internal = number
    external = optional(number)
    ip       = optional(string)
    protocol = optional(string)
  }))
}

variable "cluster_endpoint" {
  description = "The api endpoint, when empty it's the container's IP."
  type        = string
  default     = null
}

variable "node_pools" {
    description = <<-EOF
    A list of nodes pools to be provisioned for the cluster.
    Each node_pool should include at least a `name` key.
    Entry node_pools.0, if defined, acts as ingress node pool, else a default one will be created.
    See provider `terraform-aws-modules/eks/aws` workers_group_defaults for valid keys.

    Example:

    ```
    node_pools = [
      {
        name = infra
      },
      {
        name = prod
      },
      {
        name = int
      }
    ]
    ```
  EOF
  type = list(any)
  default = [{
      name = "default"
      node_count  = 2
      node_labels = []
      node_taints = []
  }]
}
