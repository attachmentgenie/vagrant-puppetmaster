# Creating a disposable test environment

## Requirements
    Virtualbox       => https://www.virtualbox.org
    Vagrant          => http://www.vagrantup.com
    librarian-puppet => gem install librarian-puppet

## Setup
    librarian-puppet install
    vagrant up
    vagrant up
    vagrant provision puppet
    vagrant ssh puppet
    sudo puppet cert --allow-dns-alt-names sign puppetmaster1.foreman.vagrant
    sudo puppet cert --allow-dns-alt-names sign puppetmaster2.foreman.vagrant
    sudo /etc/init.d/httpd restart
    exit
    vagrant provision
    
## Interfaces

### foreman

http://foreman.foreman.vagrant

### puppetdb

http://puppetdb.foreman.vagrant:8080
