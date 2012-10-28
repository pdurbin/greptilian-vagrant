# install the packages
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
    'cronie',
    'supybot-gribble',
    'munin',
    'munin-node',
  ]

  package { $server1_packages:
    ensure => installed,
  }

}
