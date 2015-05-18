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

include ::php
include ::redis
class { 'nginx': }


package { ["git", "emacs24-nox", "vim", "curl", "zip"]:
  ensure  => latest,
  require  => Exec['apt-get update'],
}
