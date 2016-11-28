class nginx
(
  $nginx_vhost_defaults = {},
  $nginx_vhost_defaults = {},
  $ssl                  = $nginx::params::ssl,
  $puppet_array         = $nginx::params::puppet_array,
  $blockdir             = $nginx::params::blockdir,
  $confdir              = $nginx::params::confdir,
  $docroot              = $nginx::params::docroot,

  $logdir               = $nginx::params::logdir,
  $default_vhost        = $nginx::params::defaultVhost,

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
  validate_bool($default_vhost)

  file {"${confdir}/nginx.conf":
    ensure  => file,
    source  => "puppet:///modules/nginx/${::osfamily}.conf",
    notify  => Service['nginx'],
    require => User["${user}"],
  }

  validate_bool($default_vhost)
  if ($default_vhost != false){
      file {"${confdir}/conf.d/default.conf":
      ensure => file,
      source => 'puppet:///modules/nginx/default.conf',
      notify => Service['nginx'],
    }
    file{'/var/www/index.html':
      ensure   => file,
      content =>  template('nginx/index.html.erb'), 
      #source  => 'puppet:///modules/nginx/index.html',
      require  => File['/var/www'],
   }
  }
    else{
      file {["${confdir}/conf.d/default.conf", "${docroot}/index.html"]:
      ensure => absent,
  }
  }
 notify{"${$nginx_vhost}":} 
 create_resources('nginx::vhost', $nginx_vhost, $nginx_vhost_defaults)


}

