# Creating a disposable test environment

## Requirements
    Virtualbox          => https://www.virtualbox.org
    Vagrant             => http://www.vagrantup.com
    vagrant-hostmanager => vagrant plugin install vagrant-hostmanager

## Setup
    git submodule update --init
    cd vagrant/${env}
    vagrant up
    
## Environments

### XXS
2 nodes => puppetmaster (puppet + puppetmaster) + node (puppet)

### XS
2 nodes => puppetmaster (puppet + puppetmaster + puppetdb) + node (puppet)

    puppetdb => http://puppetmaster.xs.vagrant:8080

### S
2 nodes => puppetmaster (puppet + puppetmaster + puppetdb + foreman) + node (puppet)

    foreman  => https://puppetmaster.s.vagrant
    puppetdb => http://puppetmaster.s.vagrant:8080


### M
2 nodes => puppetmaster (puppet + puppetmaster + puppetdb + foreman + mcollective) + node (puppet + mcollective)

    foreman  => http://puppetmaster.m.vagrant
    puppetdb => http://puppetmaster.m.vagrant:8080

### L (WIP)
3 nodes => puppetmaster (puppet+ puppetmaster + puppetdb + foreman + activemq + mcollective) + compile (puppet + puppetmaster + mcollective) +  node (puppet + mcollective)

    foreman  => http://puppetmaster.multimaster.vagrant
    puppetdb => http://puppetmaster.multimaster.vagrant:8080
    
### XL (TODO)
6 nodes => puppetmaster (puppet + puppetmaster + mcollective) + puppetdb (puppet + puppetdb) + foreman (puppet + foreman) + mcollective (puppet + activemq) + compile (puppet + puppetmaster + mcollective) +  node (puppet + mcollective)
    foreman  => http://foreman.xl.vagrant
    puppetdb => http://puppetdb.xl.vagrant:8080
    
    
### XXL (TODO)
7 nodes => puppetmaster (puppet + puppetmaster + mcollective) + db (puppet + postgresql) + puppetdb (puppet + puppetdb) + foreman (puppet + foreman) + mcollective (puppet + activemq) + compile (puppet + puppetmaster + mcollective) +  nnode (puppet + mcollective)

    foreman  => http://foreman.xxl.vagrant
    puppetdb => http://puppetdb.xx  l.vagrant:8080