group { 'group01':
  ensure => present,
}

group { 'group02':
  ensure => present,
}

user { 'user04':
  ensure => present,
  shell => '/bin/bash',
  password => '$6$xyz$RS.wHeM.mhNC0lxrp5Zds0ubSAKobEjpYvIWroBijzmu0tuqfQ1C6iBejYnxrEonuCOM0jgFUF3Dc038gW2.D.',
  groups => 'group01', 
  managehome => true,
}

user { 'user06':
  ensure => present,
  password => 'user06',
  groups => ['group01','group02'],
}