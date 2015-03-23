class isakmpd_ipsec::isakmpd_conf (
  $isakmpd_listen_on,
  $isakmpd_phase_one_lifetime,
  $isakmpd_phase_two_lifetime,
  $isakmpd_dpd_check_interval,
  $isakmpd_policy_file,
) {
  file { '/etc/isakmpd/isakmpd.conf':
    owner   => 'root',
    group   => '0',
    mode    => '0600',
    content => template('isakmpd_ipsec/isakmpd.conf.erb'),
  }  
}
