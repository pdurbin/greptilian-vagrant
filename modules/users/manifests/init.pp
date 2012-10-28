# users for server1.greptilian.com
class users {

  user { 'supybot':
    ensure => 'present',
    managehome => true,
  }

  file { '/home/supybot':
    ensure => 'directory',
    owner  => 'supybot',
    group  => 'root',
    mode   => '0755',
  }

}
