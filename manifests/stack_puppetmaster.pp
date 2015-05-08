class stack_puppetmaster (
  $foreman       = false,
  $foreman_proxy = false,
  $mcollective   = false,
  $puppetdb      = false,
  $puppetca      = false,
) {
  class { '::profile_puppet': }
  if $puppetca and $foreman_proxy {
    class { '::profile_foreman_proxy': }
    Class['::puppet'] ->
    Class['::foreman_proxy']
  }
  if $foreman {
    class { '::profile_foreman': }
    Class['::puppet'] ->
    Class['::foreman']
    if $puppetdb {
      Class['::foreman'] ->
      Class['::puppetdb::server']
    }
  }
  if $mcollective {
    class { '::profile_mcollective': }
  }
  if $puppetdb {
    class { '::profile_puppetdb': }
    if ($puppetca) {
      Class['::puppet::server::service'] ->
      Class['::puppetdb::server']
    }
  }
}