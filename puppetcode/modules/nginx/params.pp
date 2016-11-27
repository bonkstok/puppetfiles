class nginx::params{
    
  case $::osfamily{
    'redhat','debian':{
    
    $package = 'nginx'
    $blockdir = '/etc/nginx/conf.d'
    $confdir  = '/etc/nginx'
    $docroot  = '/var/www'
    $owner    = 'root'
    $group    = 'root'
    $defmode  = '0664'
    $logdir   = '/var/log/nginx'
    $servername = undef
    }
  'windows':{

    $package = undef  
    $puppet_array = ['Voeg','zelf','wat','toe',]
    $blockdir = undef
    $confdir  = undef
    $docroot  = undef
    $owner    = undef
    $group    = undef
    $defmode  = undef
    $logdir   = undef


  }
  default :{
    fail("No module found for your crappy operating system.. Must be smth like Windows")
    }}

$user = $::osfamily ?{
  'redhat'  => 'nginx',
  'debian'  => 'www-data',
  'windows' => 'nobody',}

$puppet_array = ['Voeg','zelf','wat','toe']
$ssl = false
$defaultVhost = true
}





