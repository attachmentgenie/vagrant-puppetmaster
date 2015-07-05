# Creating a disposable test environment

## Requirements
    Virtualbox          => https://www.virtualbox.org
    Vagrant             => http://www.vagrantup.com
    vagrant-hostmanager => vagrant plugin install vagrant-hostmanager

## Setup
    git submodule update --init
    
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
    vagrant up puppetmaster
    login to foreman and change the following settings
    administer, settings, puppet, enc_environment => false
    administer, settings, puppetdb, puppetdb_address, puppetdb_dashboard_address, puppetdb_enabled => true
    infrastruce, smart proxies, certificates, autosign entries, new =. *.s.vagrant
    vagrant up node
    
    foreman  => https://puppetmaster.s.vagrant
    username: admin
    passwd  : secret
    puppetdb => http://puppetmaster.s.vagrant:8080


### M
2 nodes => puppetmaster (puppet + puppetmaster + puppetdb + foreman + mcollective) + node (puppet + mcollective)

    cd vagrant/m
    vagrant up puppetmaster
    login to foreman and change the following settings
    administer, settings, puppet, enc_environment => false
    administer, settings, puppetdb, puppetdb_address, puppetdb_dashboard_address, puppetdb_enabled => true
    infrastruce, smart proxies, certificates, autosign entries, new =. *.s.vagrant
    vagrant up node
    
    foreman  => https://puppetmaster.m.vagrant
    username: admin
    passwd  : secret
    puppetdb => http://puppetmaster.m.vagrant:8080

### L
3 nodes => puppetmaster (puppet+ puppetmaster + puppetdb + foreman + activemq + mcollective) + compile (puppet + puppetmaster + mcollective) +  node (puppet + mcollective)

    cd vagrant/l
    vagrant up puppetmaster
    login to foreman and change the following settings
    administer, settings, puppet, enc_environment => false
    administer, settings, puppetdb, puppetdb_address, puppetdb_dashboard_address, puppetdb_enabled => true
    infrastruce, smart proxies, certificates, autosign entries, new =. *.s.vagrant
    vagrant up compile
    vagrant ssh puppetmaster
    sudo puppet cert clean compile.l.vagrant
    exit
    vagrant ssh compile
    sudo rm -rf /var/lib/puppet/ssl
    exit
    vagrant provision compile
    vagrant ssh puppetmaster
    sudo puppet cert --allow-dns-alt-names sign compile.l.vagrant
    exit
    vagrant provision compile
    vagrant ssh compile
    sudo /etc/init.d/httpd restart
    exit
    vagrant up node
    
    foreman  => https://puppetmaster.l.vagrant
    username: admin
    passwd  : secret
    puppetdb => http://puppetmaster.l.vagrant:8080
    
### XL (WIP)
6 nodes => puppetmaster (puppet + puppetmaster + mcollective) + puppetdb (puppet + puppetdb) + foreman (puppet + foreman) + activemq (puppet + activemq) + compile (puppet + puppetmaster + mcollective) +  node (puppet + mcollective)
    
    foreman  => http://foreman.xl.vagrant
    puppetdb => http://puppetdb.xl.vagrant:8080
    
    
### XXL (TODO)
7 nodes => puppetmaster (puppet + puppetmaster + mcollective) + db (puppet + postgresql) + puppetdb (puppet + puppetdb) + foreman (puppet + foreman) + activemq (puppet + activemq) + compile (puppet + puppetmaster + mcollective) +  node (puppet + mcollective)

    foreman  => http://foreman.xxl.vagrant
    puppetdb => http://puppetdb.xx  l.vagrant:8080