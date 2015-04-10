class profile_puppetdb () {
  class { '::puppetdb':
    listen_address     => $::ipaddress_eth1,
    manage_firewall    => false,
  }
}