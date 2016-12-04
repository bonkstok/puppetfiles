class networktime::install{

package{"${networktime::package}":
  ensure => $ensure,
#  require => User[$networktime::runas]
}

#user{$networktime::runas: For some reason this will fail the install of ntpd.
#  ensure => present,
#  shell => $networktime::shell,
#}


}
