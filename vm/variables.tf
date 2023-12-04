##########################################
#             Global Config              #
##########################################
variable "os_img_url" {
  description = "URL to the OS image"
  type        = string
  default     = "./storage/images/jammy-server-cloudimg-amd64.img" // on my local
  #   default     = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
}

variable "time_zone" {
  description = "Time Zone"
  type        = string
  default     = "Asia/Tehran"
}

variable "autostart" {
  description = "Autostart the domain"
  type        = bool
  default     = true
}

variable "index_start" {
  description = "From where the indexig start"
  type        = number
  default     = 1
}

variable "cpu_mode" {
  description = "CPU mode"
  type        = string
  default     = "host-passthrough"
}

##########################################
#           Storage Config               #
##########################################
variable "pool" {
  description = "Storage pool name"
  type        = string
  default     = "vm"
}

variable "pool-vm-dir" {
  description = "Storage pool name"
  type        = string
  default     = "/var/lib/kvm/storage"
}

##########################################
#           Network Config               #
##########################################
variable "bridge" {
  description = "Bridge interface"
  type        = string
  default     = "virbr0"
}

variable "dhcp" {
  description = "Use DHCP or Static IP settings"
  type        = bool
  default     = false
}

variable "ip_gateway" {
  description = "IP addresses of a gateway"
  type        = string
  default     = "192.168.122.1"
}

variable "ip_nameserver" {
  description = "IP addresses of a nameserver"
  type        = string
  default     = "192.168.122.1"
}

##########################################
#              Access Config             #
##########################################
variable "local_admin" {
  description = "Admin user without ssh access"
  type        = string
  default     = "local-admin"
}

variable "local_admin_passwd" {
  description = "Local admin user password, out of command: mkpasswd -m sha-512 \"123456\""
  type        = string
  default     = "$6$Auox90sh.mnvcuJC$OqvpYApZI2gEus83X6yZvUFl7M3BUYq38FytJ3bnAykEOfwz.rTjQS6uicHWgpwXzZQXHK8AGJ9vPDh/ZZEWg0"
}

variable "ssh_admin" {
  description = "Admin user with ssh access"
  type        = string
  default     = "ssh-admin"
}

variable "ssh_public_key" {
  description = "public ssh keys"
  type        = string
  default     = "~/.ssh/id_ed25519.pub"
}

variable "ssh_private_key" {
  description = "Private key for SSH connection test"
  type        = string
  default     = "~/.ssh/id_ed25519"
}

##########################################
#       Control Plane Node Config        #
##########################################
variable "vm_cp_config" {
  type = object({
    hostname = string
    count    = number
    memory   = string
    vcpu     = number
    disk     = number
  })
  default = {
    hostname = "manager-"
    count    = 1
    memory   = "3072"
    vcpu     = 2
    disk     = 10
  }
}
variable "vm_cp_ip_addr" {
  type = list(string)
  default = [
    "192.168.122.200"
  ]
}
##########################################
#         Worker Node Config             #
##########################################
variable "vm_worker_config" {
  type = object({
    hostname = string
    count    = number
    memory   = string
    vcpu     = number
    disk     = number
  })
  default = {
    hostname = "worker-"
    count    = 2
    memory   = "2048"
    vcpu     = 2
    disk     = 10
  }
}
variable "vm_worker_ip_addr" {
  type = list(string)
  default = [
    "192.168.122.201",
    "192.168.122.202"
  ]
}
