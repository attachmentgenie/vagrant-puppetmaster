class profile_postgresql (
  $manage_package_repo  = true,
  $version              = '9.4',
) {
  class { '::postgresql::globals':
    manage_package_repo => $manage_package_repo,
    version             => $version,
  }
  class { '::postgresql::client': }
  class { '::postgresql::server': }
}