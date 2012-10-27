class packages {

  $server1_packages = [
    'git',
    'bind-utils',
    'vim-enhanced',
    'screen',
    'rpm-build',
    'rubygems',
    'rpmdevtools',
    'createrepo',
    'httpd',
    'gitweb',
#    'epel-release',
  ]

  package { $server1_packages:
    ensure => installed,
  }

}
