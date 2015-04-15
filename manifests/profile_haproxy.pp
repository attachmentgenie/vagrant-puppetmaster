class profile_haproxy () {
  class { 'haproxy': }
  haproxy::listen { 'puppetmaster':
    collect_exported => false,
    ipaddress        => $::ipaddress_eth1,
    ports            => '8140',
  }
  haproxy::balancermember { 'master01':
    listening_service => 'puppetmaster',
    server_names      => 'puppetmaster1.foreman.vagrant',
    ipaddresses       => '192.168.21.140',
    ports             => '8140',
    options           => 'check',
  }
  haproxy::balancermember { 'master02':
    listening_service => 'puppetmaster',
    server_names      => 'puppetmaster2.foreman.vagrant',
    ipaddresses       => '192.168.21.141',
    ports             => '8140',
    options           => 'check',
  }
}