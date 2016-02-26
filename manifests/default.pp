$role = $trusted['extensions']['1.3.6.1.4.1.34380.1.1.100']
$tier = $trusted['extensions']['1.3.6.1.4.1.34380.1.1.101']

hiera_include('classes',['puppetmaster::role_node'])

Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

Package {
  allow_virtual => true,
}
