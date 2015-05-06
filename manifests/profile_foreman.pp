class profile_foreman (
  $apipie_task            = 'apipie:cache:index',
  $configure_epel_repo    = false,
  $db_manage              = true,
  $foreman_admin_password = 'secret',
  $foreman_host           = $::fqdn,
  $foreman_repo           = 'stable',
  $selinux                = false,
  $ssl                    = false,
  $unattended             = true,
) {
  class { '::foreman':
    admin_password      => $foreman_admin_password,
    apipie_task         => $apipie_task,
    authentication      => true,
    configure_epel_repo => $configure_epel_repo,
    db_manage           => $db_manage,
    foreman_url         => $foreman_host,
    passenger           => true,
    selinux             => $selinux,
    ssl                 => $ssl,
    repo                => $foreman_repo,
    unattended          => $unattended,
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