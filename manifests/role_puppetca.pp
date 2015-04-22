class role_puppetca () {
  class { '::epel': } ->
  class { '::profile_ntp': }
  class { '::profile_firewall': } ->
  class { '::profile_puppet': }
  class { '::profile_foreman_proxy': }

  Class['::puppet'] ->
  Class['::foreman_proxy']
}