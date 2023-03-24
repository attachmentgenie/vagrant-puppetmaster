#  vagrant-puppetserver

A vagrant setup that creates puppetservers

## Requirements
    Virtualbox                  => https://www.virtualbox.org
    Vagrant                     => http://www.vagrantup.com
    vagrant-hostmanager         => vagrant plugin install vagrant-hostmanager
    vagrant-puppet-install      => vagrant plugin install vagrant-puppet-install
    vagrant-cachier  (optional) => vagrant plugin install vagrant-cachier
    
## Preparation

    git submodule update --init
    bundle install
    
## Setup

    vagrant up

## Inspec tests

    bundle exec rake
    bundle exec rake inspec[centos7] 

## TLDR

### (G)UI interfaces

    
## Environments

### XXS
2 nodes => puppetserver (puppet + puppetserver) + node (puppet)

    cd vagrant/xxs
    vagrant up

### XS
2 nodes => puppetserver (puppet + puppetserver + postgresql + puppetdb + bolt) + node (puppet)

    cd vagrant/xs
    vagrant up
    puppetdb => http://puppetserver.xs.vagrant:8080

### S
2 nodes => puppetserver (puppet + puppetserver + postgresql + puppetdb + puppetboard + bolt) + node (puppet)

    cd vagrant/s
    vagrant up
    
    puppetboard  => http://puppetserver.s.vagrant:8088
    puppetdb => http://puppetserver.s.vagrant:8080

### M
2 nodes => puppetserver (puppet + puppetserver + postgresql + puppetdb + foreman + bolt) + node (puppet)

    cd vagrant/s
    vagrant up
    
    foreman  => https://puppetserver.m.vagrant
    username: admin
    passwd  : secret
    puppetdb => http://puppetserver.m.vagrant:8080

### L
3 nodes => puppetserver (puppet + puppetserver + postgresql + puppetdb + foreman + bolt) + compile (puppet + puppetserver) +  node (puppet)

    cd vagrant/l
    vagrant up
    
    foreman  => https://puppetserver.l.vagrant
    username: admin
    passwd  : secret
    puppetdb => http://puppetserver.l.vagrant:8080
    
### XL
5 nodes => puppetserver (puppet + puppetserver + bolt) + puppetdb (puppet + postgresql + puppetdb) + foreman (puppet + postgresql + foreman) + compile (puppet + puppetserver) +  node (puppet)
    
    cd vagrant/xl
    vagrant up puppetserver puppetdb foreman compile
    uncomment the additional section in xl/hieradata/{environment/xl.yaml,node/{puppetserver,compile}.yaml}
    comment the additional foreman section in xl/hieradata/environment/xl.yaml
    vagrant provision puppetserver puppetdb foreman compile
    vagrant up node
    
    foreman  => https://foreman.xl.vagrant
    username: admin
    passwd  : secret
    puppetdb => http://puppetdb.xl.vagrant:8080
    
    
### XXL
6 nodes => puppetserver (puppet + puppetserver + bolt) + db (puppet + postgresql) + puppetdb (puppet + puppetdb) + foreman (puppet + foreman) + compile (puppet + puppetserver) +  node (puppet)

    cd vagrant/xxl
    comment the additional db section in xxl/hieradata/node/foreman.yaml}
    vagrant up puppetserver db puppetdb foreman compile
    uncomment the additional section in xxl/hieradata/{environment/xxl.yaml,node/{puppetserver,compile}.yaml}
    comment the additional foreman section in xl/hieradata/environment/xl.yaml
    vagrant provision puppetserver db puppetdb foreman compile
    vagrant up node
    
    foreman  => https://foreman.xxl.vagrant
    username: admin
    passwd  : secret
    puppetdb => http://puppetdb.xxl.vagrant:8080
