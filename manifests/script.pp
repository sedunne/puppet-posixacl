# @summary
#   This class builds the acl script
#
# @api private
#
class posixacl::script {

  file { $posixacl::script_path:
    ensure  => present,
    owner   => $posixacl::script_owner,
    group   => $posixacl::script_group,
    mode    => $posixacl::script_mode,
    content => epp('posixacl/applyacls.epp', {'globals' => $posixacl::script_globals})
  }
}
