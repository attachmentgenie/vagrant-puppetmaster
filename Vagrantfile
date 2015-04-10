# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure("2") do |config|

###############################################################################
# Base box                                                                    #
###############################################################################
    config.vm.box = "puppetlabs/centos-6.6-64-puppet"

###############################################################################
# Global plugin settings                                                #
###############################################################################
    unless Vagrant.has_plugin?("vagrant-hosts")
      raise 'vagrant-hosts is not installed!'
    end

###############################################################################
# Global provisioning settings                                                #
###############################################################################
    default_env = 'development'
    ext_env = ENV['VAGRANT_PUPPET_ENV']
    env = ext_env ? ext_env : default_env
    orchestrate = 'puppetmaster1.foreman.vagrant'
    SCRIPT1 = "sudo puppet agent -t --environment #{env} --server #{orchestrate}; echo $?"
    foreman = 'foreman1.foreman.vagrant'
    SCRIPT2 = "sudo puppet agent -t --environment #{env} --server #{foreman}; echo $?"

###############################################################################
# Global VirtualBox settings                                                  #
###############################################################################
    config.vm.provider 'virtualbox' do |v|
    v.customize [
      'modifyvm', :id,
      '--groups', '/Vagrant/foreman'
    ]
    end

###############################################################################
# VM definitions                                                              #
###############################################################################

    config.vm.define :puppetmaster1 do |puppetmaster1_config|
      puppetmaster1_config.vm.host_name = "puppetmaster1.foreman.vagrant"
      puppetmaster1_config.vm.network :private_network, ip: "192.168.21.130"
      puppetmaster1_config.vm.synced_folder 'manifests/', '/etc/puppet/environments/development/manifests'
      puppetmaster1_config.vm.synced_folder 'modules/', '/etc/puppet/modules'
      puppetmaster1_config.vm.synced_folder 'hiera/', '/var/lib/hiera'
      puppetmaster1_config.vm.provision :hosts
      puppetmaster1_config.vm.provision :shell, inline: 'sudo cp /vagrant/hiera.yaml /etc/puppet/hiera.yaml'
      puppetmaster1_config.vm.provision :shell, inline: 'sudo cp /vagrant/autosign.conf /etc/puppet/autosign.conf'
      puppetmaster1_config.vm.provision :puppet do |puppet|
          puppet.options = "--environment #{env}"
          puppet.manifests_path = "manifests"
          puppet.manifest_file  = ""
          puppet.module_path = "modules"
          puppet.hiera_config_path = "hiera.yaml"
      end
    end

#    config.vm.define :puppetdb1 do |puppetdb1_config|
#      puppetdb1_config.vm.host_name = "puppetdb1.foreman.vagrant"
#      puppetdb1_config.vm.network :forwarded_port, guest: 22, host: 2140
#      puppetdb1_config.vm.network :private_network, ip: "192.168.21.140"
#      puppetdb1_config.vm.provision :hosts
#      puppetdb1_config.vm.provision 'shell', inline: SCRIPT1
#    end

#    config.vm.define :foreman1 do |foreman1_config|
#      foreman1_config.vm.host_name = "foreman1.foreman.vagrant"
#      foreman1_config.vm.network :forwarded_port, guest: 22, host: 2141
#      foreman1_config.vm.network :private_network, ip: "192.168.21.141"
#      foreman1_config.vm.provision :hosts
#      foreman1_config.vm.provision 'shell', inline: SCRIPT1
#    end

    config.vm.define :node1 do |node1_config|
      node1_config.vm.host_name = "node1.foreman.vagrant"
      node1_config.vm.network :forwarded_port, guest: 22, host: 2151
      node1_config.vm.network :private_network, ip: "192.168.21.151"
      node1_config.vm.provision :hosts
      node1_config.vm.provision 'shell', inline: SCRIPT1
    end
end
