class profile_puppetdb (
  $ca_server    = 'puppet',
  $puppetmaster = 'puppet',
) {
  class { '::puppet':
    ca_server      => $ca_server,
    puppetmaster   => $puppetmaster,
    server         => false,
    server_reports => 'foreman',
  } ->
  class { '::puppetdb':
    listen_address     => $::ipaddress_eth1,
    manage_firewall    => false,
  }
}