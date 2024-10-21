
source "yandex" "debian_docker" {
  disk_type           = "network-hdd"
  folder_id           = "b1g4oj1qbocerk58ophh"
  image_description   = "my custom debian with docker"
  image_name          = "debian-11-docker"
  source_image_family = "debian-11"
  ssh_username        = "debian"
  subnet_id           = "e9bennu31t8khjl5dr22"
  token               = "*****************"
  use_ipv4_nat        = true
  zone                = "ru-central1-a"
}



build {
  sources = ["source.yandex.debian_docker"]

  provisioner "shell" {
    inline = [
		"echo 'hello from packer'",
		"curl -fsSL https://get.docker.com -o get-docker.sh",
 		"sudo sh get-docker.sh -y",
		"sudo apt install htop -y",
		"sudo apt install tmux -y"
	     ]
  	}
}