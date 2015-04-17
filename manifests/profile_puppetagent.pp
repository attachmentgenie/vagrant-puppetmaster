class profile_puppetagent (
  $ca_server         = 'puppet',
  $puppetmaster      = 'puppet',
  $runinterval       = '1800',
  $splay             = false,
  $splaylimit        = '1800',
  $usecacheonfailure = true,
) {
  class { '::puppet':
    ca_server         => $ca_server,
    puppetmaster      => $puppetmaster,
    runinterval       => $runinterval,
    server            => false,
    server_reports    => 'foreman',
    splay             => $splay,
    splaylimit        => $splaylimit,
    usecacheonfailure => $usecacheonfailure,
  }
}