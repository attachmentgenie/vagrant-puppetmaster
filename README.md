# Creating a disposable test environment

## Requirements
    Virtualbox          => https://www.virtualbox.org
    Vagrant             => http://www.vagrantup.com
    librarian-puppet    => gem install librarian-puppet
    vagrant-hostmanager => vagrant plugin install vagrant-hostmanager

## Setup
    git submodule update --init
    cd vagrant/${env}
    vagrant up
    
## Environments

### XXS
2 nodes => puppetmaster (puppetmaster) + node (puppet client)

### XS
2 nodes => puppetmaster (puppetmaster + puppetdb) + node (puppet client)

    puppetdb => http://puppetmaster.xs.vagrant:8080

### S
2 nodes => puppetmaster (puppetmaster + puppetdb + foreman) + node (puppet client)

    foreman  => https://puppetmaster.s.vagrant
    puppetdb => http://puppetmaster.s.vagrant:8080


### M
2 nodes => puppetmaster (puppetmaster + puppetdb + foreman + mcollective) + node (puppet client)

    foreman  => http://puppetmaster.m.vagrant
    puppetdb => http://puppetmaster.m.vagrant:8080
    
### L
4 nodes => puppetmaster (puppetmaster) + puppetdb (puppetdb) + foreman (foreman) + mcollective (mcollective) + node (puppet client)

    foreman  => http://foreman.l.vagrant
    puppetdb => http://puppetdb.l.vagrant:8080
    