class profile_puppetca (
  $foreman = "${::fqdn}",
) {
  class { '::puppet':
    runmode               => 'none',
    server                => true,
    server_external_nodes => '',
    server_reports        => 'foreman',
    server_foreman_url    => "http://${foreman}",
  } ->
  class { '::foreman_proxy':
    foreman_base_url => "http://${foreman}",
    trusted_hosts    => [$::fqdn, $foreman],
    bmc       => false,
    dhcp      => false,
    dns       => false,
    puppetca  => true,
    puppetrun => true,
    tftp      => false,
  } ->
  cron { 'foreman-push-facts':
    command => "/usr/bin/ruby /etc/puppet/node.rb --push-facts &> /dev/null",
    user    => puppet,
    minute  => '*/2'
  }
}