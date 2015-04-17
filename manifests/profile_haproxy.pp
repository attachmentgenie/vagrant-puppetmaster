class profile_haproxy () {
  class { 'haproxy': }
  haproxy::frontend { 'puppetmaster':
    ipaddress    => $::ipaddress_eth1,
    ports        => '8140',
    mode         => 'tcp',
    bind_options => 'verify none',
    options      => {
      'acl'             => 'ca path -m sub certificate',
      'default_backend' => 'puppetmaster',
      'use_backend'     => 'puppetca if ca',
    },
  }
  haproxy::backend { 'puppetca':
    options      => {
      'option'      => [
        'tcplog',
        'ssl-hello-chk',
      ],
    },
  }
  Haproxy::Balancermember <<| listening_service == 'puppetca' |>>
  haproxy::backend { 'puppetmaster':
    options      => {
      'balance'     => 'roundrobin',
      'option'      => [
        'tcplog',
        'ssl-hello-chk',
      ],
      'stick'       => ' on src',
      'stick-table' =>  'type ip size 1m expire 1m',
    },
  }
  Haproxy::Balancermember <<| listening_service == 'puppetmaster' |>>
}