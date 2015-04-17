class role_node () {
  class { '::profile_ntp': }
  class { '::profile_firewall': } ->
  class { '::profile_puppetagent': }
}