# == Class: isakmpd_ipsec
#
# Full description of class isakmpd_ipsec here.
#
# === Parameters
#
# Document parameters here.
#
# [*sample_parameter*]
#   Explanation of what this parameter affects and what it defaults to.
#   e.g. "Specify one or more upstream ntp servers as an array."
#
# === Variables
#
# Here you should define a list of variables that this module would require.
#
# [*sample_variable*]
#   Explanation of how this variable affects the funtion of this class and if
#   it has a default. e.g. "The parameter enc_ntp_servers must be set by the
#   External Node Classifier as a comma separated list of hostnames." (Note,
#   global variables should be avoided in favor of class parameters as
#   of Puppet 2.6.)
#
# === Examples
#
#  class { 'isakmpd_ipsec':
#    servers => [ 'pool.ntp.org', 'ntp.local.company.com' ],
#  }
#
# === Authors
#
# Author Name <author@domain.com>
#
# === Copyright
#
# Copyright 2014 Your name here, unless otherwise noted.
#
class isakmpd_ipsec (
  $isakmpd_listen_on          = $::isakmpd_ipsec::params::isakmpd_listen_on,
  $isakmpd_phase_one_lifetime = $::isakmpd_ipsec::params::isakmpd_phase_one_lifetime,
  $isakmpd_phase_two_lifetime = $::isakmpd_ipsec::params::isakmpd_phase_two_lifetime,
  $isakmpd_dpd_check_interval = $::isakmpd_ipsec::params::isakmpd_dpd_check_interval,
  $isakmpd_policy_file        = $::isakmpd_ipsec::params::isakmpd_policy_file,
  $isakmpd_service_flags      = $::isakmpd_ipsec::params::isakmpd_service_flags,
  $isakmpd_service_ensure     = $::isakmpd_ipsec::params::isakmpd_service_ensure,
  $ipsec_flows,
) inherits isakmpd_ipsec::params {
  class { 'isakmpd_ipsec::isakmpd_conf':
    isakmpd_listen_on          => $isakmpd_listen_on,
    isakmpd_phase_one_lifetime => $isakmpd_phase_one_lifetime,
    isakmpd_phase_two_lifetime => $isakmpd_phase_two_lifetime,
    isakmpd_dpd_check_interval => $isakmpd_dpd_check_interval,
    isakmpd_policy_file        => $isakmpd_policy_file,
  }

  class { 'isakmpd_ipsec::service':
    isakmpd_ensure => $isakmpd_service_ensure,
    isakmpd_flags  => $isakmpd_service_flags,
  }

  create_resources(isakmpd_ipsec::ipsec_conf, $ipsec_flows)

  Class['isakmpd_ipsec::isakmpd_conf'] ~>
  Class['isakmpd_ipsec::service']
}
