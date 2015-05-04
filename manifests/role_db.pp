class role_db () {
  class { '::profile_ntp': }
  class { '::profile_firewall': } ->
  class { '::profile_puppet': }
  class { '::profile_postgresql': }
}