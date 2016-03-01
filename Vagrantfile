# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.define "core01" do |conf|
    conf.vm.box = "debian/jessie64"
    conf.vm.network "private_network", type: "dhcp"
  end

  config.vm.define "core02" do |conf|
    conf.vm.box = "debian/jessie64"
    conf.vm.network "private_network", type: "dhcp"
  end

  config.vm.define "edge01" do |conf|
    conf.vm.box = "debian/jessie64"
    conf.vm.network "private_network", type: "dhcp"
  end

  config.vm.define "edge02" do |conf|
    conf.vm.box = "debian/jessie64"
    conf.vm.network "private_network", type: "dhcp"
  end

  # Route Google's anycast IP over the public network.
  # This is a workaround for Vagrant providing the VMs with colliding IP
  # addresses, so that ansible_default_ipv4.address is the same on all
  # machines.
  config.vm.provision "shell", inline: "ip route add 8.8.8.8 via 172.28.128.1 || /bin/true"

  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "site.yml"
    ansible.groups = {
      "backbone:children" => ["core", "edge"],
      "site" => [],
      "core" => ["core01", "core02"],
      "edge" => ["edge01", "edge02"]
    }
    ansible.host_vars = {
      "core01" => {"seq" => 1},
      "core02" => {"seq" => 2},
      "edge01" => {"seq" => 1},
      "edge02" => {"seq" => 2}
    }
  end

end
