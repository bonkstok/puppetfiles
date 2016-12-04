class networktime::service{
  
  service{$networktime::service:
    ensure => $networktime::service_state,
    enable => $networktime::service_enable,
  }

}
