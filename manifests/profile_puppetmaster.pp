class profile_puppetmaster (
  $ca_server    = 'puppet',
  $foreman      = 'foreman',
  $puppetmaster = 'puppet',
) {
  class { '::puppet':
    runmode               => 'none',
    server                => true,
    server_ca             => false,
    ca_server             => $ca_server,
    puppetmaster          => $puppetmaster,
    server_external_nodes => '',
    server_foreman_url    => "https://$ca_server",
    server_reports        => 'foreman',
  } ->
  class { '::foreman_proxy':
    foreman_base_url => "http://$foreman",
    trusted_hosts    => [$::fqdn, $foreman],
    bmc       => false,
    dhcp      => false,
    dns       => false,
    puppetca  => false,
    puppetrun => true,
    tftp      => false,
  }
}