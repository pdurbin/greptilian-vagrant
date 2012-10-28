# for starting services, mostly
class last {

  service { 'iptables':
    ensure => running,
  }

  service { 'httpd':
    ensure    => running,
    enable    => true,
    subscribe => [
      File['/etc/httpd/conf.d/0greptilian.conf'],
      File['/etc/httpd/conf.d/welcome.conf'],
      File['/etc/httpd/conf.d/yum.greptilian.com.conf'],
      File['/etc/httpd/conf.d/git.greptilian.com.conf'],
    ]
  }

  # FIXME: change to server1.greptilian.com with /etc/munin/munin.conf
  service { 'munin-node':
    ensure    => running,
    enable    => true,
  }

  service { 'crond':
    ensure => running,
    subscribe => [
      File['/var/spool/cron/supybot'],
    ]
  }

}
