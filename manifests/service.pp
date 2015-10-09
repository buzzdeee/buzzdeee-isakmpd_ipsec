# This class takes care about managing
# the isakmpd service
class isakmpd_ipsec::service (
  $isakmpd_ensure,
  $isakmpd_flags,
) {
  service { 'isakmpd':
    ensure => $isakmpd_ensure,
    flags  => $isakmpd_flags,
  }
}
