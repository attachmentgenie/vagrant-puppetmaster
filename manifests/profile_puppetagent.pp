class profile_puppetagent (
  $ca_server    = 'puppet.foreman.vagrant',
  $puppetmaster = 'puppet.foreman.vagrant',
) {
  class { '::puppet':
    ca_server      => $ca_server,
    puppetmaster   => $puppetmaster,
    runmode        => 'none',
    server         => false,
    server_reports => 'foreman',
  }
}