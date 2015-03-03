$ntpservice = $osfamily ? {
 'redhat' => 'ntpd',
 'debian' => 'ntp',
 'default' => 'ntp',
}
node 'wiki' { 

  package { 'ntp':
   ensure => 'installed',}
  
  service { $ntpservice:
    ensure => 'running',
	enable => true,
  
  }
}
node 'wikitest' { 
  package { 'ntp':
    ensure => 'installed',}
  
  service { $ntpservice:
    ensure => 'running',
	enable => true,
}
}