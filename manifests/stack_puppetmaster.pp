class stack_puppetmaster (
  $balancermember = false,
  $foreman        = true,
  $puppetdb       = true,
) {
  class { '::profile_puppet': }
  class { '::profile_foreman_proxy': }
  Class['::puppet'] ->
  Class['::foreman_proxy']

  if $balancermember {
    class { '::profile_haproxy_balancermember': }
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