# @summary
#   This class hands installation of ACL package(s)
#
# @api private
#
class posixacl::install {

  package { $posixacl::package_name:
    ensure => $posixacl::package_ensure
  }
}
