class role_puppetca () {
  class { '::profile_firewall': } ->
  class { '::profile_puppetca': }
}