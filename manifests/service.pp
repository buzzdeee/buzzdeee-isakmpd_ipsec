class isakmpd_ipsec::service (
  $isakmpd_ensure,
  $isakmpd_flags,
) {

  if $isakmpd_ensure == 'running' {
    $value = 1
  } else {
    $value = 0
  }

  Sysctl::Value { value => $value }

  sysctl::value { 'net.inet.ah.enable': }
  sysctl::value { 'net.inet.esp.enable': }
  sysctl::value { 'net.inet.ipcomp.enable': }


  service { 'isakmpd':
    ensure => $isakmpd_ensure,
    flags  => $isakmpd_flags,
  }
}
