# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|

  config.vm.define "core01" do |asteroid|
    asteroid.vm.box = "debian/jessie64"
  end

  config.vm.define "core02" do |asteroid|
    asteroid.vm.box = "debian/jessie64"
  end

  config.vm.define "edge01" do |asteroid|
    asteroid.vm.box = "debian/jessie64"
  end

  config.vm.define "edge02" do |asteroid|
    asteroid.vm.box = "debian/jessie64"
  end

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
