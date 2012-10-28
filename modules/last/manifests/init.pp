class last {

  service { 'iptables':
    ensure => running
  }

  service { 'httpd':
    ensure => running
  }

}
