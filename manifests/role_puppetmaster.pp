class role_puppetmaster () {
  class { '::epel': } ->
  class { '::profile_ntp': } ->
  class { '::profile_selinux': } ->
  class { '::profile_firewall': } ->
  class { '::stack_puppetmaster': }
}