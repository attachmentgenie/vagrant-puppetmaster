# Setup the standardized stages as defined in the stdlib
include ::stdlib

# Check if a role was signed into the certificate otherwise look it up in hiera, otherwise hope that attachmentgenie-roles is present
if $trusted['extensions']['pp_role'] {
  include "roles::${trusted['extensions']['pp_role']}"
} else {
  lookup('classes', Array[String], 'first', ['roles::node']).include
}

# Lazy high level definition of the most common bin directories
Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", "/usr/local/bin/"] }
