class role_puppetdb () {
  class { '::profile_firewall': } ->
  class { '::profile_puppetdb': }
}