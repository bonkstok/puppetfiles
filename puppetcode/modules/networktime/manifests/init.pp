class networktime(

  $time_servers = $networktime::params::time_servers,
  $ensure = $networktime::params::ensure,
  $service_state = $networktime::params::service_state,
  $service_enable = $networktime::params::service_enable,

) inherits networktime::params {
  $test = "hoi"
  validate_array($time_servers)
  validate_bool($service_enable)
  validate_string($service_state)

#Class['networktime::install'] -> Class['networktime::config'] ~> Class['networktime::service']
  class {'networktime::install':} -> class {'networktime::config':} ~> class {'networktime::service':}
#class {'networktime::install':} -> class {''}
#notify{$time_servers:}
}
