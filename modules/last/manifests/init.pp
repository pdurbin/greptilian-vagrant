# for starting services, mostly
class last {

  service { 'iptables':
    ensure    => running,
    subscribe => File['/etc/sysconfig/iptables'],
  }

  service { 'httpd':
    ensure    => running,
    enable    => true,
    subscribe => [
      File['/etc/httpd/conf.d/0greptilian.conf'],
      File['/etc/httpd/conf.d/welcome.conf'],
      File['/etc/httpd/conf.d/yum.greptilian.com.conf'],
      File['/etc/httpd/conf.d/git.greptilian.com.conf'],
      File['/etc/httpd/conf.d/munin.greptilian.com.conf'],
      File['/etc/httpd/conf.d/munin.conf'],
      File['/etc/httpd/conf.d/thinkup.greptilian.com.conf'],
      File['/etc/httpd/conf.d/wiki.greptilian.com.conf'],
      File['/etc/httpd/conf.d/irclog.greptilian.com.conf'],
    ]
  }

  service { 'munin-node':
    ensure    => running,
    enable    => true,
    subscribe => File['/etc/munin/munin.conf'],
  }

}
