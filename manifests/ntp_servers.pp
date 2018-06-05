class devnet_demo::ntp_servers (
  Hash $ntp = {},
) {

  $ntp.each |$server, $parameters| {
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

  # Purge unmanaged resources
  # resources { 'ntp_server': 
  #   purge => true,
  #   before => Ntp_server[keys($ntp)]
  # }
}