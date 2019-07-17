# @summary Manages building the acl yaml config
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
}