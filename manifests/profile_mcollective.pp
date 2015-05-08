class profile_mcollective (
  $client           = false,
  $middleware       = false,
  $middleware_hosts = [$::fqdn],
) {
    class { '::mcollective':
      client           => $client,
      middleware_hosts => $middleware_hosts,
    }
}