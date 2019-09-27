class devopsin::deploy {
 file {'/root/devopsin':
 ensure => directory,
 mode => '0777'
 }
 file {'/root/devopsin/addressbook.war':
 mode => '0777',
 source => "puppet:///modules/devopsin/addressbook.war"
 }
 file {'/root/devopsin/Dockerfile':
 mode => '0777',
 source => "puppet:///modules/devopsin/Dockerfile"
 }
 exec {'Docker-build':
 cwd => '/root/devopsin/',
 command => '/usr/bin/docker build . -t edureka/devopsclass'
 }
 exec {'Docker-run':
 cwd => '/root/devopsin/',
 command => '/usr/bin/docker run -it -d -p 8083:8080 edureka/devopsclass'
 }
}
