class role_puppetdb () {
  class { '::profile_ntp': }
  class { '::profile_firewall': } ->
  class { '::profile_puppet': }
  class { '::profile_puppetdb': }

  Class['::puppet'] ->
  Class['::puppetdb']
}