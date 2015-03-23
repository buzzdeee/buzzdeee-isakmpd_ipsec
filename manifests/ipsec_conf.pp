define isakmpd_ipsec::ipsec_conf (
  $localip,
  $peerip,
  $mynetworks,
  $remotenetworks,
  $preshared_key,
  $main_auth = 'hmac-sha1',
  $main_enc  = 'aes-128',
  $main_dh_group = 'modp1024',
  $quick_auth = 'hmac-sha1',
  $quick_enc  = 'aes-128',
  $quick_dh_group = 'modp1024',
) {

  file { "/etc/ipsec.conf.$title":
    owner   => 'root',
    group   => '0',
    mode    => '0640',
    content => template('isakmpd_ipsec/ipsec.conf.erb'),
  }

  exec { "reset old $title flow":
    command => "/sbin/ipsecctl -d -f /etc/ipsec.conf.$title",
    refreshonly => true,
    subscribe   => File["/etc/ipsec.conf.$title"],
    before      => Exec["set new $title flow"]
  }

  exec { "set new $title flow":
    command => "/sbin/ipsecctl -f /etc/ipsec.conf.$title",
    refreshonly => true,
    subscribe   => File["/etc/ipsec.conf.$title"],
  }

}
