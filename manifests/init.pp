# @summary Manage POSIX Filesystem ACLs
class posixacl (
  String $package_name,
  String $package_ensure,
  String $script_globals,
  String $script_path,
  String $script_owner,
  String $script_group,
  String $script_mode,
  Hash   $acl_lists
){

  contain posixacl::install
  contain posixacl::aclconfig
  contain posixacl::script

  Class['posixacl::install']
  -> Class['posixacl::aclconfig']
  -> Class['posixacl::script']
}
