class role_puppetmaster () {
  class { '::epel': } ->
  class { '::profile_firewall': } ->
  class { '::profile_puppetmaster': }
}