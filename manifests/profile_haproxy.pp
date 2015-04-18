class profile_haproxy () {
  class { 'haproxy': }
  haproxy::listen { 'puppetmaster':
    ipaddress => $::ipaddress_eth1,
    ports     => '8140',
  }
  Haproxy::Balancermember <<| listening_service == 'puppetmaster' |>>
}