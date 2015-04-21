class profile_foreman (
  $foreman_admin_password = 'secret',
  $foreman_host           = $::fqdn,
  $foreman_repo           = 'stable',
  $puppetmaster           = 'puppet',
) {
  class { '::puppet':
    puppetmaster   => $puppetmaster,
    server         => false,
    server_reports => 'foreman',
  } ->
  class { '::foreman':
    admin_password => $foreman_admin_password,
    apipie_task    => 'apipie:cache',
    foreman_url    => $foreman_host,
    unattended     => false,
    authentication => true,
    passenger      => true,
    ssl            => false,
    selinux        => false,
    repo           => $foreman_repo,
  } ->
  class { '::foreman::cli':
    foreman_url => $foreman_host,
    username    => 'admin',
    password    => $foreman_admin_password,
  }
  ::foreman::plugin { 'puppetdb':
    package => 'ruby193-rubygem-puppetdb_foreman',
  }
}