class role_foreman () {
  class { '::profile_ntp': }
  class { '::profile_firewall': } ->
  class { '::profile_foreman': }
}