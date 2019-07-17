# @summary Install ACL Package(s)
#
# @api private
#
class posixacl::instal {

  package { $posixacl::package_name:
    ensure => $posixacl::package_ensure
  }
}
