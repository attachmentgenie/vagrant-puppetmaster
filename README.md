# Creating a disposable test environment

## Requirements
    Virtualbox       => https://www.virtualbox.org
    Vagrant          => http://www.vagrantup.com
    librarian-puppet => gem install librarian-puppet

## Setup
    librarian-puppet install
    cd vagrant/${env}
    vagrant up
    
## Environments

### XXS
2 nodes => puppetmaster (puppetmaster) + node (puppet client)

### XS
2 nodes => puppetmaster (puppetmaster + puppetdb) + node (puppet client)

    puppetdb => http://puppetmaster.puppet.vagrant:8080

### S
2 nodes => puppetmaster (puppetmaster + puppetdb + foreman) + node (puppet client)

    foreman  => http://puppetmaster.puppet.vagrant
    puppetdb => http://puppetmaster.puppet.vagrant:8080


### M
2 nodes => puppetmaster (puppetmaster + puppetdb + foreman + mcollective) + node (puppet client)

    foreman  => http://puppetmaster.puppet.vagrant
    puppetdb => http://puppetmaster.puppet.vagrant:8080
    
### L
4 nodes => puppetmaster (puppetmaster) + puppetdb (puppetdb) + foreman (foreman) + mcollective (mcollective) + node (puppet client)

    foreman  => http://foreman.puppet.vagrant
    puppetdb => http://puppetdb.puppet.vagrant:8080
    