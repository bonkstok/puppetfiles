class profile::webservernginx(){
#$create_vhost = hiera('nginx::vhost', {})
include nginx
$my_vhost = hiera('nginx::vhost', {})
include motd

nginx::vhost{'myfirst':}

create_resources('nginx::vhost', $my_vhost)


}
