lookup('classes', Array[String], 'unique', ['roles::node']).include

Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

Package {
  allow_virtual => true,
}
