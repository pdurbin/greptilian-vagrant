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
    'perl-YAML-LibYAML',
    'gcc',
    'perl-HTML-Tree',
    'perl-local-lib',
    'perl-YAML',
    'perl-Readonly',
    'perl-Crypt-SSLeay',
    'php',
    'php-mysql',
    'php-pdo',
    'php-gd',
    'mysql-server',
  ]

  package { $server1_packages:
    ensure => installed,
  }

}
