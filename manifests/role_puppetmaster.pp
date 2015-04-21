class role_puppetmaster () {
  class { '::epel': } ->
  class { '::profile_ntp': } ->
  class { '::profile_selinux': } ->
  class { '::profile_firewall': } ->
  class { '::profile_puppet': }
  class { '::profile_foreman_proxy': }
  class { '::profile_haproxy_balancermember': }

  Class['::puppet'] ->
  Class['::foreman_proxy']
}