class profile_foreman_proxy (
  $foreman_host = 'foreman',
  $puppetca     = false,
) {
  class { '::foreman_proxy':
    foreman_base_url => "http://${$foreman_host}",
    trusted_hosts    => [$::fqdn, $foreman_host],
    bmc              => false,
    dhcp             => false,
    dns              => false,
    puppetca         => $puppetca,
    puppetrun        => true,
    tftp             => false,
  } ->
  cron { 'foreman-push-facts':
    command => "/usr/bin/ruby /etc/puppet/node.rb --push-facts &> /dev/null",
    user    => puppet,
    minute  => '*/2'
  }
}