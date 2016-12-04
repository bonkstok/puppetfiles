class networktime::config{

 file{$networktime::config_file:
    ensure => present,
    owner => $networktime::owner,
    group => $networktime::group,
    mode  => $networktime::mode,
    content => template('networktime/ntp.erb')
 } 

}
