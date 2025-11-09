package { 'apache2':
  ensure => installed,
}

package { 'libapache2-mod-php':
  ensure  => installed,
  notify  => Service['apache2'],
  require => Package['apache2'],
}

package { 'php-cli':
  ensure  => installed,
  notify  => Service['apache2'],
  require => Package['apache2'],
}

package { 'php-mysql':
  ensure  => installed,
  notify  => Service['apache2'],
  require => Package['apache2'],
}

file { '/var/www/html/phpinfo.php':
  source  => '/home/sarsen/sb_inet4031_puppet_lab9/phpinfo.php',
  notify  => Service['apache2'],
  require => [Package['apache2']],
}

service { 'apache2':
  ensure  => running,
  enable  => true,
  require => [Package['apache2'], Package['libapache2-mod-php'], Package['php-cli'], Package['php-mysql']],
}

package { 'mariadb-server':
  ensure => installed,
}

service { 'mysql':
  ensure  => running,
  enable  => true,
  require => Package['mariadb-server'],
}