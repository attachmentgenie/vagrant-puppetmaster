class profile_foreman (
  $foreman_admin_password = 'secret',
  $foreman_host   = $::fqdn,
  $foreman_repo   = 'stable'
) {
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
  }
  ::foreman::plugin { 'default_hostgroup': }
  ::foreman::plugin { 'puppetdb':
    package => 'ruby193-rubygem-puppetdb_foreman',
  }
}