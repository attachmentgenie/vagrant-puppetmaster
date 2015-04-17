class role_puppetca () {
  class { '::epel': } ->
  class { '::profile_ntp': }
  class { '::profile_firewall': } ->
  class { '::profile_puppetca': }
}