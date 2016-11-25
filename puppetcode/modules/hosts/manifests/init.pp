class hosts{
  host{'testing.puppetlabs.vm':
    ensure => present,
    ip     => '127.0.0.1',
  }
 host{'adding_pups':
    name         => 'pups',
    ensure       => present,
    ip           => '9.1.2.1',
    host_aliases => ['hank','hank.puppet.local','myserver.somewhere.here',],
 }
 host{'adding':
   ensure => absent,}

   #host {'remove_master':
   #name         => 'addMaster',
   #ensure       => absent,
   #before       => Host['addMasters'],
   #}
   # host {'addMasters':
   # ensure       => present, 
   # name         => 'master1',
   # host_aliases => ['puppet','puppetmaster.puppetlabs.vm',],
   # ip           => '192.168.88.11',
   # require      => Host['remove_master'],
   # }

host{'master':
  ensure       => present,
  host_aliases => ['puppet','master.puppetlabs.vm',],
  ip           => '192.168.88.11',
}
}
