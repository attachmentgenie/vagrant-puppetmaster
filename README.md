# Creating a disposable test environment

## Requirements
    Virtualbox                  => https://www.virtualbox.org
    Vagrant                     => http://www.vagrantup.com
    vagrant-hostmanager         => vagrant plugin install vagrant-hostmanager
    vagrant-cachier  (optional) => vagrant plugin install vagrant-cachier
    vagrant-triggers (optional) => vagrant plugin install vagrant-triggers
    
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
    vagrant up
    
    foreman  => https://puppetmaster.s.vagrant
    username: admin
    passwd  : secret
    puppetdb => http://puppetmaster.s.vagrant:8080


### M
2 nodes => puppetmaster (puppet + puppetmaster + puppetdb + foreman + activemq + mcollective) + node (puppet + mcollective)

    cd vagrant/m
    vagrant up
    
    foreman  => https://puppetmaster.m.vagrant
    username: admin
    passwd  : secret
    puppetdb => http://puppetmaster.m.vagrant:8080

### L
3 nodes => puppetmaster (puppet + puppetmaster + puppetdb + foreman + activemq + mcollective) + compile (puppet + puppetmaster + mcollective) +  node (puppet + mcollective)

    cd vagrant/l
    vagrant up
    
    foreman  => https://puppetmaster.l.vagrant
    username: admin
    passwd  : secret
    puppetdb => http://puppetmaster.l.vagrant:8080
    
### XL
6 nodes => puppetmaster (puppet + puppetmaster + mcollective) + puppetdb (puppet + puppetdb) + foreman (puppet + foreman) + activemq (puppet + activemq) + compile (puppet + puppetmaster + mcollective) +  node (puppet + mcollective)
    
    cd vagrant/xl
    vagrant up puppetmaster puppetdb foreman activemq compile
    uncomment the additional section in xl/hieradata/{environment/xl.yaml,node/{puppetmaster,compile}.yaml}
    comment the additional foreman section in xl/hieradata/environment/xl.yaml
    vagrant provision puppetmaster puppetdb foreman activemq compile
    vagrant up node
    
    foreman  => https://foreman.xl.vagrant
    username: admin
    passwd  : secret
    puppetdb => http://puppetdb.xl.vagrant:8080
    
    
### XXL
7 nodes => puppetmaster (puppet + puppetmaster + mcollective) + db (puppet + postgresql) + puppetdb (puppet + puppetdb) + foreman (puppet + foreman) + activemq (puppet + activemq) + compile (puppet + puppetmaster + mcollective) +  node (puppet + mcollective)

    cd vagrant/xxl
    comment the additional db section in xxl/hieradata/node/foreman.yaml}
    vagrant up puppetmaster db puppetdb foreman activemq compile
    uncomment the additional section in xxl/hieradata/{environment/xxl.yaml,node/{puppetmaster,compile}.yaml}
    comment the additional foreman section in xl/hieradata/environment/xl.yaml
    vagrant provision puppetmaster db puppetdb foreman activemq compile
    vagrant up node
    
    foreman  => https://foreman.xl.vagrant
    username: admin
    passwd  : secret
    puppetdb => http://puppetdb.xl.vagrant:8080
