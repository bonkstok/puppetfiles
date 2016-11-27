class nginx
(
  
  # $package = nginx::params::package,
  $ssl      = $nginx::params::ssl,
  $puppet_array = $nginx::params::puppet_array,
  $blockdir = $nginx::params::blockdir,
  $confdir = $nginx::params::confdir,
  $docroot = $nginx::params::docroot,
  #$owner   = nginx::params::owner,
  #$group   = nginx::params::group,
  #$defmode = nginx::params::defmode,
  $logdir  = $nginx::params::logdir,
  $defaultVhost = $nginx::params::defaultVhost,
)inherits nginx::params

{
  File{
    owner => $user,
    group => $group,
    mode  => $defmode,
  }

   notify {"${user} created...${defaultVhost}":}
  package{'nginx':
    ensure => installed,
  }

  #if($defaultVhost == false){
  # file{"${blockdir}/default.conf":
  #   ensure => absent,
  # }}
  user{"${user}":
   ensure     => present,
   managehome => 'false',
   shell      => '/sbin/nologin',
   before     => File["${confdir}/nginx.conf"],
  }
  service{'nginx':
    ensure  => running,
    enable  => 'true',
    require => Package['nginx'],
  }

  file {'/var/www':
    ensure => directory,
   require => Package['nginx'],
   } 
  file{'/var/www/index.html':
   ensure   => file,
   content =>  template('nginx/index.html.erb'), 
   #source  => 'puppet:///modules/nginx/index.html',
   require  => File['/var/www'],
   }
  file {"${confdir}/nginx.conf":
    ensure  => file,
    source  => "puppet:///modules/nginx/${::osfamily}.conf",
    notify  => Service['nginx'],
    require => User["${user}"],
  }
  if ($defaultVhost == true){
      file {"${confdir}/conf.d/default.conf":
      ensure => file,
      source => 'puppet:///modules/nginx/default.conf',
      notify => Service['nginx'],
    }}
    else{
      file {"${confdir}/conf.d/default.conf":
      ensure => absent,
  }
  }}

