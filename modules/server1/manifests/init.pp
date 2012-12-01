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

  file { '/etc/httpd/conf.d/thinkup.greptilian.com.conf':
    source => 'puppet:///modules/server1/etc/httpd/conf.d/thinkup.greptilian.com.conf',
  }

  file { '/var/www/thinkup':
    ensure => directory,
  }

  file { '/var/www/thinkup/webapp':
    ensure  => directory,
    owner   => 'apache',
    mode    => '0755',
    require => File['/var/www/thinkup'],
  }

  file { '/var/www/thinkup/webapp/data/':
    ensure  => directory,
    require => File['/var/www/thinkup/webapp'],
    owner   => 'apache',
    mode    => '0755',
  }

  file { '/etc/httpd/conf.d/yum.greptilian.com.conf':
    source => 'puppet:///modules/server1/etc/httpd/conf.d/yum.greptilian.com.conf',
    owner  => 'root',
    group  => 'root',
    mode   => '0444',
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

  file { '/etc/httpd/conf.d/irclog.greptilian.com.conf':
    source => 'puppet:///modules/server1/etc/httpd/conf.d/irclog.greptilian.com.conf',
  }

  file { '/var/www/wiki':
    ensure => directory,
    owner  => 'pdurbin',
  }

  file { '/var/www/irclog':
    ensure => directory,
    owner  => 'root',
  }

  file { '/var/www/irclog/ilbot':
    ensure  => directory,
    require => File['/var/www/irclog'],
  }

  file { '/var/www/irclog/ilbot/cgi':
    ensure  => directory,
    require => File['/var/www/irclog/ilbot'],
  }

  file { '/var/www/irclog/ilbot/cgi/database.conf':
    source  => 'puppet:///modules/server1/var/www/irclog/ilbot/cgi/database.conf',
    require => File['/var/www/irclog/ilbot/cgi'],
  }

  file { '/var/www/irclog/ilbot/bot.conf':
    source  => 'puppet:///modules/server1//var/www/irclog/ilbot/bot.conf',
    require => File['/var/www/irclog/ilbot'],
  }

  file { '/var/www/irclog/ilbot/cgi/camelia.png':
    source  => 'puppet:///modules/server1/var/www/irclog/ilbot/cgi/camelia.png',
    require => File['/var/www/irclog/ilbot/cgi'],
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
    ensure  => directory,
    require => File['/usr/local/greptilian'],
  }

  file { '/usr/local/greptilian/bin':
    ensure  => directory,
    require => File['/usr/local/greptilian'],
  }

  file { '/srv/wiki-srcdir':
    ensure => directory,
    owner  => 'pdurbin',
  }

  file { '/usr/local/greptilian/bin/wiki-setup':
    source  => 'puppet:///modules/server1/usr/local/greptilian/bin/wiki-setup',
    require => File['/usr/local/greptilian/bin'],
  }

  file { '/usr/local/greptilian/sbin/yum-setup':
    source  => 'puppet:///modules/server1/usr/local/greptilian/sbin/yum-setup',
    require => File['/usr/local/greptilian/sbin'],
  }

  file { '/usr/local/greptilian/sbin/supybot-setup' :
    source  => 'puppet:///modules/server1/usr/local/greptilian/sbin/supybot-setup',
    require => File['/usr/local/greptilian/sbin'],
  }

  file { '/usr/share/perl5/vendor_perl/IrcLog.pm' :
    source  => 'puppet:///modules/server1/usr/share/perl5/vendor_perl/IrcLog.pm',
  }

  file { '/usr/share/perl5/vendor_perl/IrcLog' :
    ensure => directory,
  }

  file { '/usr/share/perl5/vendor_perl/IrcLog/WWW.pm' :
    source  => 'puppet:///modules/server1/usr/share/perl5/vendor_perl/IrcLog/WWW.pm',
    require => File['/usr/share/perl5/vendor_perl/IrcLog'],
  }

  class { 'mysql::server':
    config_hash => { 'root_password' => 'foo' }
  }

  mysql::db { 'moritz5':
    user     => 'moritz',
    password => 'foo',
    host     => 'localhost',
    grant    => ['all'],
  }

  class { 'mysql::backup':
    backupuser     => 'mysqldump',
    backuppassword => 'foo',
    backupdir      => '/var/www/data/mysql',
    require        => File['/var/www/data'],
  }

  file { '/var/www/data' :
    ensure => directory,
  }

}
