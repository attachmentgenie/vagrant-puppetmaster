class role_proxy () {
  class { '::profile_firewall': }
  class { '::profile_haproxy': }
}