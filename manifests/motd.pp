class devnet_demo::motd (
  String $motd   = 'Managed by Puppet'
) {

  banner { 'default':
    motd => $motd,
  }

}
