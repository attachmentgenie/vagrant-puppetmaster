class profile_puppetca (
  $foreman_admin_password = 'secret',
  $foreman_host           = $::fqdn,
  $foreman_repo           = 'stable'
) {
  class { '::puppet':
    runmode               => 'none',
    server                => true,
    server_external_nodes => '',
    server_reports        => 'foreman',
  } ->
  class { '::foreman':
    admin_password => $foreman_admin_password,
    apipie_task    => 'apipie:cache',
    foreman_url    => $foreman_host,
    unattended     => false,
    authentication => true,
    passenger      => true,
    ssl            => true,
    selinux        => false,
    repo           => $foreman_repo,
  } ->
  class { '::foreman::cli':
    foreman_url => $foreman_host,
    username    => 'admin',
    password    => $foreman_admin_password,
  } ->
  class { '::foreman_proxy':
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
  #::foreman::plugin { 'default_hostgroup': }
  #::foreman::plugin { 'puppetdb':
  #  package => 'ruby193-rubygem-puppetdb_foreman',
  #}
}