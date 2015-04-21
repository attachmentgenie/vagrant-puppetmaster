class profile_haproxy_balancermember () {
  @@haproxy::balancermember { "puppetmaster-${::hostname}":
    listening_service => 'puppetmaster',
    server_names      => $::hostname,
    ipaddresses       => $::ipaddress_eth1,
    ports             => '8140',
    options           => 'check',
  }
}