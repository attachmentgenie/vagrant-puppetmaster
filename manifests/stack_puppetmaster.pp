class stack_puppetmaster (
  $db            = true,
  $foreman       = true,
  $foreman_proxy = true,
  $puppetdb      = true,
) {
  class { '::profile_puppet': }
  if $foreman_proxy {
    class { '::profile_foreman_proxy': }
    Class['::puppet'] ->
    Class['::foreman_proxy']
  }
  if $db {
    class { '::profile_postgresql': }
  }
  if $foreman {
    class { '::profile_foreman': }
    Class['::puppet'] ->
    Class['::foreman']
  }
  if $puppetdb {
    class { '::profile_puppetdb': }
    Class['::puppet::server::service'] ->
    Class['::puppetdb::server']
  }
}