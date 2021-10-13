#  vagrant-puppetmaster

A vagrant setup that creates puppetmasters

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
2 nodes => puppetmaster (puppet + puppetmaster) + node (puppet)

    cd vagrant/xxs
    vagrant up

### XS
2 nodes => puppetmaster (puppet + puppetmaster + puppetdb) + node (puppet)

    cd vagrant/xs
    vagrant up
    puppetdb => http://puppetmaster.xs.vagrant:8080

### S
2 nodes => puppetmaster (puppet + puppetmaster + puppetdb + foreman) + node (puppet)

    cd vagrant/s
    vagrant up
    
    foreman  => https://puppetmaster.s.vagrant
    username: admin
    passwd  : secret
    puppetdb => http://puppetmaster.s.vagrant:8080


### M
Currently not in use.

### L
3 nodes => puppetmaster (puppet + puppetmaster + puppetdb + foreman + bolt) + compile (puppet + puppetmaster) +  node (puppet)

    cd vagrant/l
    vagrant up
    
    foreman  => https://puppetmaster.l.vagrant
    username: admin
    passwd  : secret
    puppetdb => http://puppetmaster.l.vagrant:8080
    
### XL
5 nodes => puppetmaster (puppet + puppetmaster) + puppetdb (puppet + puppetdb) + foreman (puppet + foreman) + compile (puppet + puppetmaster) +  node (puppet)
    
    cd vagrant/xl
    vagrant up puppetmaster puppetdb foreman compile
    uncomment the additional section in xl/hieradata/{environment/xl.yaml,node/{puppetmaster,compile}.yaml}
    comment the additional foreman section in xl/hieradata/environment/xl.yaml
    vagrant provision puppetmaster puppetdb foreman compile
    vagrant up node
    
    foreman  => https://foreman.xl.vagrant
    username: admin
    passwd  : secret
    puppetdb => http://puppetdb.xl.vagrant:8080
    
    
### XXL
6 nodes => puppetmaster (puppet + puppetmaster) + db (puppet + postgresql) + puppetdb (puppet + puppetdb) + foreman (puppet + foreman) + compile (puppet + puppetmaster) +  node (puppet)

    cd vagrant/xxl
    comment the additional db section in xxl/hieradata/node/foreman.yaml}
    vagrant up puppetmaster db puppetdb foreman compile
    uncomment the additional section in xxl/hieradata/{environment/xxl.yaml,node/{puppetmaster,compile}.yaml}
    comment the additional foreman section in xl/hieradata/environment/xl.yaml
    vagrant provision puppetmaster db puppetdb foreman compile
    vagrant up node
    
    foreman  => https://foreman.xxl.vagrant
    username: admin
    passwd  : secret
    puppetdb => http://puppetdb.xxl.vagrant:8080
