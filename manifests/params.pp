# Do not use directly, this class defines some
# default values for the module
class isakmpd_ipsec::params {
  $isakmpd_listen_on          = '0.0.0.0'
  $isakmpd_phase_one_lifetime = '28800,60:86400'
  $isakmpd_phase_two_lifetime = '1200,60:86400'
  $isakmpd_dpd_check_interval = '10'
  $isakmpd_policy_file        = '/etc/isakmpd/isakmpd.policy'
  $isakmpd_service_flags      = '-4 -K'
  $isakmpd_service_ensure     = 'running'
}
