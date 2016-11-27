#manage motd messages
class motd{
    case $::osfamily{
    	'redhat', 'debian':{
    		file{'/etc/motd':
    			ensure => file,
    			content => template('motd/generate.motd.erb')
    	}}
    	default :{
    		fail("Only available on redhat or debian based hosts.")
    	}
    	}
    }
