# for starting services, mostly
class last {

  service { 'iptables':
    ensure => running,
  }

  service { 'httpd':
    ensure    => running,
    subscribe => [
      File['/etc/httpd/conf.d/0greptilian.conf'],
      File['/etc/httpd/conf.d/welcome.conf'],
      File['/etc/httpd/conf.d/yum.greptilian.com.conf'],
      File['/etc/httpd/conf.d/git.greptilian.com.conf'],
    ]
  }

}
