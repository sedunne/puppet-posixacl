# @summary 
#   This module manages POSIX filesystem ACLs.
#
# @example Basic usage
#   include ::posixacl
#
# @param package_name
#   The name of the package(s) that provides the ACL tools and support
#
# @param package_ensure
#   The installed state of the ACL package.
#
# @param script_globals
#   Specifies global options that should be applied to every call of setfacl
#
# @param script_path
#   Specifies the path to the applyacl script
#
# @param script_owner
#   Specifies the owner of the script
#
# @param script_group
#   Specifies the group for the script
#
# @param script_mode
#   Specifies the mode for the script
#
# @param acl_lists
#   Specifies a list of targets that share a similar ACL and settings
#
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
