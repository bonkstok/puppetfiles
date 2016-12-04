class networktime::params{

  case $::osfamily{
    'redhat', 'debian':{

    	$config_file = '/etc/ntp.conf'
    	$owner = 'root'
    	$group = 'root'
    	$defmode = '0664'
    	$time_servers = ['server 0.nl.pool.ntp.org','server 1.nl.pool.ntp.org', 'server 2.nl.pool.ntp.org']
    	$runas = 'ntp'
    	$shell = $::osfamily ? {
	 	 'redhat' => '/sbin/nologin',
	 	 'debian' => '/usr/sbin/nologin'}
    	$ensure = 'present'
    	$package = 'ntp'
    	$service_state = 'running'
    	$service = $::osfamily?{
    		'redhat' => 'ntpd',
    		'debian' => 'ntp',}
    	$service_enable = true
}
    default :{
    	fail("Only suitable for redhat or debian at this time") }
}
}
