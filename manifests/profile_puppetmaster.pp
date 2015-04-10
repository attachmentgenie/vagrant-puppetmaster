class profile_puppetmaster () {
  class { '::puppet':
    runmode                     => 'none',
    server                      => true,
    server_external_nodes       => '',
  }
}