class profile_foreman (
  $apipie_task            = 'apipie:cache:index',
  $foreman_admin_password = 'secret',
  $foreman_host           = $::fqdn,
  $foreman_repo           = 'stable',
  $unattended             = false,
) {
  class { '::foreman':
    admin_password      => $foreman_admin_password,
    apipie_task         => $apipie_task,
    configure_epel_repo => false,
    foreman_url         => $foreman_host,
    unattended          => $unattended,
    authentication      => true,
    passenger           => true,
    ssl                 => false,
    selinux             => false,
    repo                => $foreman_repo,
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