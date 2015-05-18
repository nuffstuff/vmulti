# default path
Exec {
	path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

# silence puppet and vagrant annoyance about the puppet group
group { 'puppet':
	ensure => 'present'
}

# ensure local apt cache index is up to date before beginning
exec { 'apt-get update':
	command => '/usr/bin/apt-get update'
}

include '::ntp'

$override_options = { 'mysqld' => 
                        { 'max_connections' => '400',
                          'max_connect_errors' => '1000',
                          'character-set-server' => 'utf8',
                          'bind-address' => '0.0.0.0' 
                        } 
                    }

class { '::mysql::server':
#  service_provider 		  => "systemd",
  root_password           => 'N@Ge4O9XFXMBfieuRoSh+iWHA|OKB|',
  remove_default_accounts => true,
  override_options        => $override_options
}

mysql::db { 'dev':
  ensure   => 'present',
  user     => 'dev',
  password => 'dev',
  host     => 'localhost',
  charset  => 'utf8',
  collate  => 'utf8_general_ci',
  grant	   => ['ALL'],
} 

include '::mysql::client'

