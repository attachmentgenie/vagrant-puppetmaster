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
    unless Vagrant.has_plugin?("vagrant-hostmanager")
      raise 'vagrant-hostmanager is not installed!'
    end

###############################################################################
# Global provisioning settings                                                #
###############################################################################
    default_env = 'production'
    ext_env = ENV['VAGRANT_PUPPET_ENV']
    env = ext_env ? ext_env : default_env
    PUPPETCA     = "sudo puppet agent -t --environment #{env} --server puppet.foreman.vagrant; echo $?"
    PUPPETMASTER = "sudo puppet agent -t --environment #{env} --server puppetmaster.foreman.vagrant; echo $?"

###############################################################################
# Global VirtualBox settings                                                  #
###############################################################################
    config.vm.provider 'virtualbox' do |v|
    v.customize [
      'modifyvm', :id,
      '--groups', '/Vagrant/puppetmaster'
    ]
    end

###############################################################################
# Global /etc/hosts file settings                                                  #
###############################################################################
    config.hostmanager.enabled = true
    config.hostmanager.manage_host = true
    config.hostmanager.ignore_private_ip = false
    config.hostmanager.include_offline = true

###############################################################################
# VM definitions                                                              #
###############################################################################

    config.vm.define :puppet do |puppet_config|
      puppet_config.vm.host_name = "puppet.foreman.vagrant"
      puppet_config.vm.network :private_network, ip: "192.168.21.130"
      puppet_config.vm.synced_folder 'manifests/', "/etc/puppet/environments/#{env}/manifests"
      puppet_config.vm.synced_folder 'modules/', "/etc/puppet/environments/#{env}/modules"
      puppet_config.vm.synced_folder 'hiera/', '/var/lib/hiera'
      puppet_config.vm.provision :shell, inline: 'sudo cp /vagrant/files/hiera.yaml /etc/puppet/hiera.yaml'
      puppet_config.vm.provision :shell, inline: 'sudo cp /vagrant/files/autosign.conf /etc/puppet/autosign.conf'
      puppet_config.vm.provision :puppet do |puppet|
          puppet.options = "--environment #{env}"
          puppet.manifests_path = "manifests"
          puppet.manifest_file  = ""
          puppet.module_path = "modules"
          puppet.hiera_config_path = "files/hiera.yaml"
      end
    end

    config.vm.define :puppetdb do |puppetdb_config|
      puppetdb_config.vm.host_name = "puppetdb.foreman.vagrant"
      puppetdb_config.vm.network :forwarded_port, guest: 22, host: 2131
      puppetdb_config.vm.network :private_network, ip: "192.168.21.131"
      puppetdb_config.vm.provision 'shell', inline: PUPPETCA
    end

    config.vm.define :foreman do |foreman_config|
      foreman_config.vm.host_name = "foreman.foreman.vagrant"
      foreman_config.vm.network :forwarded_port, guest: 22, host: 2132
      foreman_config.vm.network :private_network, ip: "192.168.21.132"
      foreman_config.vm.provision 'shell', inline: PUPPETCA
    end

    config.vm.define :puppetmaster1 do |puppetmaster1_config|
      puppetmaster1_config.vm.host_name = "puppetmaster1.foreman.vagrant"
      puppetmaster1_config.vm.network :forwarded_port, guest: 22, host: 2140
      puppetmaster1_config.vm.network :private_network, ip: "192.168.21.140"
      puppetmaster1_config.vm.synced_folder 'manifests/', "/etc/puppet/environments/#{env}/manifests"
      puppetmaster1_config.vm.synced_folder 'modules/', "/etc/puppet/environments/#{env}/modules"
      puppetmaster1_config.vm.synced_folder 'hiera/', '/var/lib/hiera'
      puppetmaster1_config.vm.provision :shell, inline: 'sudo cp /vagrant/files/hiera.yaml /etc/puppet/hiera.yaml'
      puppetmaster1_config.vm.provision :shell, inline: 'sudo cp /vagrant/files/puppetmaster1/puppet.conf /etc/puppet/puppet.conf'
      puppetmaster1_config.vm.provision 'shell', inline: PUPPETCA
    end

    config.vm.define :puppetmaster2 do |puppetmaster2_config|
      puppetmaster2_config.vm.host_name = "puppetmaster2.foreman.vagrant"
      puppetmaster2_config.vm.network :forwarded_port, guest: 22, host: 2141
      puppetmaster2_config.vm.network :private_network, ip: "192.168.21.141"
      puppetmaster2_config.vm.synced_folder 'manifests/', "/etc/puppet/environments/#{env}/manifests"
      puppetmaster2_config.vm.synced_folder 'modules/', "/etc/puppet/environments/#{env}/modules"
      puppetmaster2_config.vm.synced_folder 'hiera/', '/var/lib/hiera'
      puppetmaster2_config.vm.provision :shell, inline: 'sudo cp /vagrant/files/hiera.yaml /etc/puppet/hiera.yaml'
      puppetmaster2_config.vm.provision :shell, inline: 'sudo cp /vagrant/files/puppetmaster2/puppet.conf /etc/puppet/puppet.conf'
      puppetmaster2_config.vm.provision 'shell', inline: PUPPETCA
    end

    config.vm.define :puppetmaster do |puppetmaster_config|
      puppetmaster_config.vm.host_name = "puppetmaster.foreman.vagrant"
      puppetmaster_config.vm.network :forwarded_port, guest: 22, host: 2150
      puppetmaster_config.vm.network :private_network, ip: "192.168.21.150"
      puppetmaster_config.vm.provision 'shell', inline: PUPPETCA
    end

    config.vm.define :node do |node_config|
      node_config.vm.host_name = "node.foreman.vagrant"
      node_config.vm.network :forwarded_port, guest: 22, host: 2160
      node_config.vm.network :private_network, ip: "192.168.21.160"
      node_config.vm.provision 'shell', inline: PUPPETMASTER
    end
end
