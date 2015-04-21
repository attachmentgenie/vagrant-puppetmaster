class profile_puppetdb (
  $puppetmaster = 'puppet',
) {
  class { '::puppet':
    puppetmaster   => $puppetmaster,
    server         => false,
    server_reports => 'foreman',
  } ->
  class { '::puppetdb':
    listen_address  => $::fqdn,
    manage_firewall => false,
  }
}