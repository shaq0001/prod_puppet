node 'wiki' { 
 class { 'linux':
 }
}
node 'wikitest' { 
 class { 'linux':
 }
}
class linux {

  $admintools = ['git', 'nano', 'screen']
  package { $admintools:
   ensure => 'installed',
  
  }

   file { '/info.txt':
     ensure  => 'present',
	 content => inline_template("Created by Puppet at <%= Time.now %>\n"),
      }

  $ntpservice = $osfamily ? {
   'redhat' => 'ntpd',
   'debian' => 'ntp',
   'default' => 'ntp',
}

  package { 'ntp':
   ensure => 'installed',}
  
  service { $ntpservice:
    ensure => 'running',
	enable => true,
  
  }

}

