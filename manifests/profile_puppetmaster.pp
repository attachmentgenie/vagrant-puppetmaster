class profile_puppetmaster (
  $ca_server    = 'puppet',
  $certname     = 'puppet',
  $foreman      = 'foreman',
  $puppetmaster = 'puppet',
) {
  class { '::puppet':
    ca_server             => $ca_server,
    dns_alt_names         => [$::fqdn,$certname],
    puppetmaster          => $puppetmaster,
    runmode               => 'none',
    server                => true,
    server_ca             => false,
    server_certname       => $certname,
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