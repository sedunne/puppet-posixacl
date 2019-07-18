# @summary
#   This class builds the acl yaml config
#
# @api private
#
class posixacl::aclconfig {

  concat { '/etc/posixacls.yaml':
    ensure => present,
    owner  => 0,
    group  => 0,
    mode   => '0640'
  }

  concat::fragment { 'posixacls_yaml_header':
    target  => '/etc/posixacls.yaml',
    order   => '01',
    content => epp('posixacl/posixacls_yaml_header.epp')
  }

  concat::fragment { 'posixacls_yaml_lists':
    target  => '/etc/posixacls.yaml',
    order   => '02',
    content => epp('posixacl/posixacls_yaml_lists.epp', {'acl_list' => $posixacl::acl_lists})
  }
}
