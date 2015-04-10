class role_foreman () {
  class { '::profile_firewall': } ->
  class { '::profile_foreman': }
}