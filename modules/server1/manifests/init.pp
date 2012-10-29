# config for server1.greptilian.com
class server1 {

  #user { 'git':
  #  ensure     => 'present',
  #  managehome => true,
  #}
  #
  #file { '/home/git':
  #  ensure => 'directory',
  #  owner  => 'git',
  #  group  => 'root',
  #  mode   => '0700',
  #}

  file { '/var/lib/git':
    ensure => 'directory',
    owner  => 'pdurbin',
    group  => 'root',
    mode   => '0755',
  }

  file { '/etc/gitweb.conf':
    source => 'puppet:///modules/server1/etc/gitweb.conf',
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
  }

  file { '/etc/yum.repos.d/greptilian.repo':
    source => 'puppet:///modules/server1/etc/yum.repos.d/greptilian.repo',
  }

  file { '/etc/httpd/conf.d/0greptilian.conf':
    source => 'puppet:///modules/server1/etc/httpd/conf.d/0greptilian.conf',
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
  }

  file { '/etc/httpd/conf.d/welcome.conf':
    source => 'puppet:///modules/server1/etc/httpd/conf.d/welcome.conf',
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
  }

  file { '/etc/httpd/conf.d/yum.greptilian.com.conf':
    source => 'puppet:///modules/server1/etc/httpd/conf.d/yum.greptilian.com.conf',
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
  }

  file { '/var/www/html/git-down':
    ensure => directory;
  }

  file { '/var/www/html/git-down/index.html':
    source  => 'puppet:///modules/server1/var/www/html/git-down/index.html',
    require => File['/var/www/html/git-down'],
  }

  file { '/etc/httpd/conf.d/git.greptilian.com.conf':
    source => 'puppet:///modules/server1/etc/httpd/conf.d/git.greptilian.com.conf',
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
  }

  file { '/etc/httpd/conf.d/munin.greptilian.com.conf':
    source => 'puppet:///modules/server1/etc/httpd/conf.d/munin.greptilian.com.conf',
  }

  file { '/etc/httpd/conf.d/munin.conf':
    source => 'puppet:///modules/server1/etc/httpd/conf.d/munin.conf',
  }

  file { '/etc/munin/munin.conf':
    source => 'puppet:///modules/server1/etc/munin/munin.conf',
  }

  file { '/etc/httpd/conf.d/wiki.greptilian.com.conf':
    source => 'puppet:///modules/server1/etc/httpd/conf.d/wiki.greptilian.com.conf',
  }

  file { '/var/www/wiki':
    ensure => directory,
    owner  => 'pdurbin',
  }

  file { '/usr/local/greptilian/sbin/greptilian-puppet-apply':
    source  => 'puppet:///modules/server1/usr/local/greptilian/sbin/greptilian-puppet-apply',
    owner   => 'root',
    group   => 'root',
    mode    => '0744',
    require => File['/usr/local/greptilian/sbin'],
  }

  file { '/etc/sysconfig/iptables':
    source => 'puppet:///modules/server1/etc/sysconfig/iptables',
    owner  => 'root',
    group  => 'root',
    mode   => '0600',
  }

  file { '/home/supybot/crimsonfubot.conf':
    source => 'puppet:///modules/server1/home/supybot/crimsonfubot.conf',
    owner  => 'supybot',
  }

  file { '/usr/local/greptilian':
    ensure => directory,
  }

  file { '/usr/local/greptilian/sbin':
    ensure => directory,
    require => File['/usr/local/greptilian'],
  }

  file { '/usr/local/greptilian/bin':
    ensure => directory,
    require => File['/usr/local/greptilian'],
  }

  file { '/srv/wiki-srcdir':
    ensure => directory,
    owner  => 'pdurbin',
  }

  file { '/usr/local/greptilian/bin/wiki-setup':
    source => 'puppet:///modules/server1/usr/local/greptilian/bin/wiki-setup',
    require => File['/usr/local/greptilian/bin'],
  }

  file { '/usr/local/greptilian/sbin/yum-setup':
    source => 'puppet:///modules/server1/usr/local/greptilian/sbin/yum-setup',
    require => File['/usr/local/greptilian/sbin'],
  }

  file { '/usr/local/greptilian/sbin/supybot-setup' :
    source => 'puppet:///modules/server1/usr/local/greptilian/sbin/supybot-setup',
    require => File['/usr/local/greptilian/sbin'],
  }

}
