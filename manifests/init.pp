# @summary Manage POSIX Filesystem ACLs
class posixacl (
  String $package_name,
  String $package_ensure,
  String $script_globals,
  String $script_path,
  String $script_owner,
  String $script_group,
  String $script_mode
){

  contain posixacl::install
  contain posixacl::aclconfig

  Class['posixacl::install']
  -> Class['posixacl::aclconfig']
}
