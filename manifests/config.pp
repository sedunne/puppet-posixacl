# @summary Manages building the acl script
#
# @api private
#
class posixacl::config {

  concat { $posixacl::script_path:
    ensure => present,
    owner  => $posixacl::script_owner,
    group  => $posixacl::script_group,
    mode   => $posixacl::script_mode
  }

  concat::fragment { 'applyacl_header':
    target  => $posixacl::script_path,
    order   => '01',
    content => epp('posixacl/applyacl_header.epp', {'globals' => $posixacl::global_options})
  }
}
