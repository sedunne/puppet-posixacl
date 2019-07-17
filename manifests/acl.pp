# Definition: posixacl::acl
#
# Set POSIX filesystem ACL on a target
#
# Parameters:
#   $target  - The file/directory you want to set an ACL on.
#   $acl     - The ACL that you want to set on the provided target.
#   $recurse - If you want the ACL to be recursively applied. Only matters for directories. (Optional)
#   $default - Whether to set the ACL as default. Only matters for directories. (Optional)
define posixacl::acl (
  String  $acl,
  String  $target = $title,
  Boolean $recurse = false,
  Boolean $default = false
) {
  ## puppet-lint doesn't really have a concept of local scope, and I do the hash this way to make the
  ##  template call below more readable. if there's some reason not to do this, or a better lint-happy
  ##  option, I'm all for it
  # lint:ignore:variable_scope
  $posixacl_acl_hash = {
    'target'  => $target,
    'acl'     => $acl,
    'recurse' => $recurse,
    'default' => $default
  }

  include ::posixacl

  concat::fragment { 'posixacls_yaml_acl':
    target  => '/etc/posixacls.yaml',
    order   => '03',
    content => epp('posixacl/posixacls_yaml_acl.epp', {'acl' => $posixacl_acl_hash})
  }
  # lint:endignore
}
