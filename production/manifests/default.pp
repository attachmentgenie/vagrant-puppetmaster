if $trusted['extensions']['pp_role'] {
  include "roles::${trusted['extensions']['pp_role']}"
} else {
  lookup('classes', Array[String], 'first', ['roles::node']).include
}

Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

Package {
  allow_virtual => true,
}
