class stack_puppetmaster (
  $db             = true,
  $foreman        = true,
  $puppetdb       = true,
) {
  class { '::profile_puppet': }
  class { '::profile_foreman_proxy': }
  Class['::puppet'] ->
  Class['::foreman_proxy']

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
    Class['::puppet'] ->
    Class['::puppetdb']
  }
}