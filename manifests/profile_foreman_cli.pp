class profile_foreman_cli (
  $foreman_admin_password = 'secret',
  $foreman_host   = $::fqdn,
) {
  class { '::foreman::cli':
    foreman_url => $foreman_host,
    username    => 'admin',
    password    => $foreman_admin_password,
  }
}