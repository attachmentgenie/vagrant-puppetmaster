class profile_foreman_proxy (
  $foreman    = "${::fqdn}",
  $puppet_ca  = true,
  $puppet_run = true
) {
  class { '::foreman_proxy':
    foreman_base_url => "http://${foreman}",
    trusted_hosts    => [$::fqdn, $foreman],
    bmc              => false,
    dhcp             => false,
    dns              => false,
    puppetca         => $puppet_ca,
    puppetrun        => $puppet_run,
    tftp             => false,
  }
}