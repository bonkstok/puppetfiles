#include nginx
class {'nginx':
 defaultVhost => false,}


nginx::vhost{'testing.vm':}
nginx::vhost{'kpn.com':}
#  puppet_array => ['een','drie',],
#}
#nginx::vhost{'training_puppet':}
#nginx::vhost{'testingbaby':
#  puppet_array => ['eerste','tweede',],
#}
nginx::vhost{'jvv.vm':
  puppet_array => ['I', 'will','be','back'],
  ssl          => true,
  sslCert      => "/etc/nginx/ssl/jvv_vm.pem",
  sslCertKey   => "/etc/nginx/ssl/jvv_vm.key"
}
#nginx::vhost{'ger.vm':
#  puppet_array => ['een','vijf',],
#  ssl          => true,
#  sslCert      => "/etc/nginx/ssl/ger_vm.pem",
#  sslCertKey   => "/etc/nginx/ssl/ger_vm.key",
#}
#class {'nginx':
#  puppet_array => ['eerste', 'tweede', 'derde', 'vierde,'],
#}
