class profile_foreman_proxy (
  $puppet_ca  = true,
  $puppet_run = true
) {
  class { '::foreman_proxy':
    bmc       => false,
    dhcp      => false,
    dns       => false,
    puppetca  => $puppet_ca,
    puppetrun => $puppet_run,
    tftp      => false,
  }
}