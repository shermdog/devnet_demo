class devnet_demo::ntp (
  Boolean $purge = false,
  Hash $servers = {},
) {

  $servers.each |$server, $parameters| {
    ntp_server { $server:
      ensure           => $parameters[ensure],
      key              => $parameters[key],
      minpoll          => $parameters[minpoll],
      maxpoll          => $parameters[maxpoll],
      prefer           => $parameters[prefer],
      source_interface => $parameters[source_interface],
      vrf              => $parameters[vrf],
    }
  }

  # Purge unmanaged instances if enabled
  if $purge {
    resources { 'ntp_server':
      purge => true,
      noop  => $noop,
    }
  }
}
