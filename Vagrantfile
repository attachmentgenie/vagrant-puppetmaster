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
    default_env = 'production'
    ext_env = ENV['VAGRANT_PUPPET_ENV']
    env = ext_env ? ext_env : default_env
    PUPPET          = "sudo puppet agent -t --environment #{env} --ca_server puppet.foreman.vagrant; echo $?"
    PUPPETMASTER    = "sudo puppet agent -t --environment #{env} --server puppet.foreman.vagrant --ca_server puppet.foreman.vagrant; echo $?"
    PUPPETAGENT     = "sudo puppet agent -t --environment #{env} --server puppetmaster.foreman.vagrant --ca_server puppet.foreman.vagrant; echo $?"

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

    config.vm.define :puppet do |puppet_config|
      puppet_config.vm.host_name = "puppet.foreman.vagrant"
      puppet_config.vm.network :private_network, ip: "192.168.21.130"
      puppet_config.vm.synced_folder 'manifests/', '/etc/puppet/environments/production/manifests'
      puppet_config.vm.synced_folder 'modules/', '/etc/puppet/environments/production/modules'
      puppet_config.vm.synced_folder 'hiera/', '/var/lib/hiera'
      puppet_config.vm.provision :hosts
      puppet_config.vm.provision :shell, inline: 'sudo cp /vagrant/hiera.yaml /etc/puppet/hiera.yaml'
      puppet_config.vm.provision :shell, inline: 'sudo cp /vagrant/autosign.conf /etc/puppet/autosign.conf'
      puppet_config.vm.provision :puppet do |puppet|
          puppet.options = "--environment #{env}"
          puppet.manifests_path = "manifests"
          puppet.manifest_file  = ""
          puppet.module_path = "modules"
          puppet.hiera_config_path = "hiera.yaml"
      end
    end

    config.vm.define :puppetdb do |puppetdb_config|
      puppetdb_config.vm.host_name = "puppetdb.foreman.vagrant"
      puppetdb_config.vm.network :forwarded_port, guest: 22, host: 2131
      puppetdb_config.vm.network :private_network, ip: "192.168.21.131"
      puppetdb_config.vm.provision :hosts
      puppetdb_config.vm.provision 'shell', inline: PUPPET
    end

    config.vm.define :foreman do |foreman_config|
      foreman_config.vm.host_name = "foreman.foreman.vagrant"
      foreman_config.vm.network :forwarded_port, guest: 22, host: 2132
      foreman_config.vm.network :private_network, ip: "192.168.21.132"
      foreman_config.vm.provision :hosts
      foreman_config.vm.provision 'shell', inline: PUPPET
    end

    config.vm.define :puppetmaster1 do |puppetmaster1_config|
      puppetmaster1_config.vm.host_name = "puppetmaster1.foreman.vagrant"
      puppetmaster1_config.vm.network :forwarded_port, guest: 22, host: 2140
      puppetmaster1_config.vm.network :private_network, ip: "192.168.21.140"
      puppetmaster1_config.vm.synced_folder 'manifests/', '/etc/puppet/environments/production/manifests'
      puppetmaster1_config.vm.synced_folder 'modules/', '/etc/puppet/modules'
      puppetmaster1_config.vm.synced_folder 'hiera/', '/var/lib/hiera'
      puppetmaster1_config.vm.provision :hosts
      puppetmaster1_config.vm.provision :shell, inline: 'sudo cp /vagrant/hiera.yaml /etc/puppet/hiera.yaml'
      puppetmaster1_config.vm.provision 'shell', inline: PUPPETMASTER
    end

    config.vm.define :puppetmaster2 do |puppetmaster2_config|
      puppetmaster2_config.vm.host_name = "puppetmaster2.foreman.vagrant"
      puppetmaster2_config.vm.network :forwarded_port, guest: 22, host: 2141
      puppetmaster2_config.vm.network :private_network, ip: "192.168.21.141"
      puppetmaster2_config.vm.synced_folder 'manifests/', '/etc/puppet/environments/production/manifests'
      puppetmaster2_config.vm.synced_folder 'modules/', '/etc/puppet/modules'
      puppetmaster2_config.vm.synced_folder 'hiera/', '/var/lib/hiera'
      puppetmaster2_config.vm.provision :hosts
      puppetmaster2_config.vm.provision :shell, inline: 'sudo cp /vagrant/hiera.yaml /etc/puppet/hiera.yaml'
      puppetmaster2_config.vm.provision 'shell', inline: PUPPETMASTER
    end

    config.vm.define :puppetmaster do |puppetmaster_config|
      puppetmaster_config.vm.host_name = "puppetmaster.foreman.vagrant"
      puppetmaster_config.vm.network :forwarded_port, guest: 22, host: 2150
      puppetmaster_config.vm.network :private_network, ip: "192.168.21.150"
      puppetmaster_config.vm.provision :hosts
      puppetmaster_config.vm.provision 'shell', inline: PUPPETAGENT
    end

    config.vm.define :node1 do |node1_config|
      node1_config.vm.host_name = "node1.foreman.vagrant"
      node1_config.vm.network :forwarded_port, guest: 22, host: 2160
      node1_config.vm.network :private_network, ip: "192.168.21.160"
      node1_config.vm.provision :hosts
      node1_config.vm.provision 'shell', inline: PUPPET
    end

    config.vm.define :node2 do |node2_config|
      node2_config.vm.host_name = "node2.foreman.vagrant"
      node2_config.vm.network :forwarded_port, guest: 22, host: 2161
      node2_config.vm.network :private_network, ip: "192.168.21.161"
      node2_config.vm.provision :hosts
      node2_config.vm.provision 'shell', inline: PUPPETAGENT
    end

    config.vm.define :node3 do |node3_config|
      node3_config.vm.host_name = "node3.foreman.vagrant"
      node3_config.vm.network :forwarded_port, guest: 22, host: 2162
      node3_config.vm.network :private_network, ip: "192.168.21.162"
      node3_config.vm.provision :hosts
      node3_config.vm.provision 'shell', inline: PUPPETAGENT
    end
end
