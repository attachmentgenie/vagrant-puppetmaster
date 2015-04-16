class profile_puppetmaster (
  $ca_server    = 'puppet',
  $certname     = 'puppet',
  $foreman      = 'foreman',
  $puppetdb     = 'puppetdb',
  $puppetmaster = 'puppet',
) {
  class { '::puppet':
    ca_server                    => $ca_server,
    dns_alt_names                => [$::fqdn,$certname],
    puppetmaster                 => $puppetmaster,
    runmode                      => 'none',
    server                       => true,
    server_ca                    => false,
    server_certname              => $certname,
    server_external_nodes        => '',
    server_foreman_url           => "http://${foreman}",
    server_puppetdb_host         => $puppetdb,
    server_reports               => 'foreman',
    server_storeconfigs_backend  => 'puppetdb',
  } ->
  class { '::foreman_proxy':
    foreman_base_url => "http://${foreman}",
    trusted_hosts    => [$::fqdn, $foreman],
    bmc              => false,
    dhcp             => false,
    dns              => false,
    puppetca         => false,
    puppetrun        => true,
    tftp             => false,
  } ->
  cron { 'foreman-push-facts':
    command => "/usr/bin/ruby /etc/puppet/node.rb --push-facts &> /dev/null",
    user    => puppet,
    minute  => '*/2'
  }
  @@haproxy::balancermember { "haproxy-${::hostname}":
    listening_service => 'puppetmaster',
    server_names      => $::hostname,
    ipaddresses       => $::ipaddress_eth1,
    ports             => '8140',
    options           => 'check',
  }
}