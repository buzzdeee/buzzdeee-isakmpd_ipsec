# This class takes care about managing
# the isakmpd service
class isakmpd_ipsec::service (
  $isakmpd_ensure,
  $isakmpd_flags,
) {

  if $isakmpd_ensure == 'running' {
    $value = 1
  } else {
    $value = 0
  }

  Sysctl { value => $value }

  sysctl { 'net.inet.ah.enable': }
  sysctl { 'net.inet.esp.enable': }
  sysctl { 'net.inet.ipcomp.enable': }


  service { 'isakmpd':
    ensure => $isakmpd_ensure,
    flags  => $isakmpd_flags,
  }
}
