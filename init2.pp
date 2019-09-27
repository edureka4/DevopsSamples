class apache2{
 exec {'apt-update':
 command => '/usr/bin/apt-get update'
 }
 package {'default-jdk':
 ensure => present
 }
 package {'apache2':
 ensure => present,
 require => Exec['apt-update']
 }
 exec {'apache_full_access':
 command => "/usr/sbin/ufw allow 'Apache Full'"
 }
 file {'/var/www/html/index.html':
 mode => '0644',
 content => "<html>
 <head><title>Demo Tutorial</title></head>
 <body>This is the Module Demo</body>
 </head>"
 }
}
