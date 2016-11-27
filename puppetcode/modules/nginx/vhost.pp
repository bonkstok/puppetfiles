define nginx::vhost(
  $ssl = $nginx::ssl,
  $servername = $title,
  $port = '80',
  $puppet_array = $nginx::puppet_array,
  $docroot = "${nginx::docroot}/vhost/${title}",
  $sslCert = undef,
  $sslCertKey = undef,
)
{
  File{
    owner => $nginx::user,
    group => $nginx::group,
  }

  file{"vhost-${title}":
    ensure     => file,
    path       => "${nginx::blockdir}/${title}.conf",
    content    => template('nginx/vhost.conf.erb'),
    notify     => Service['nginx'],
  }
  file{$docroot:
    ensure => directory,
    before => File["vhost-${title}"],
  }
  file{"${docroot}/index.html":
    ensure  => file,
    require => File["vhost-${title}"],
    content => template('nginx/index.html.erb'),
 }
  }
