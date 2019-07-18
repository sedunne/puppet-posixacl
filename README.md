# Posixacl

#### Table of Contents

1. [Description](#description)
2. [Setup - The basics of getting started with Posixacl](#setup)
    * [Beginning with Posixacl](#beginning-with-Posixacl)
3. [Usage - Configuration options and additional functionality](#usage)
4. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)

## Description

Posixacl is a Puppet module to help manage filesystem ACLs on POSIX systems. Similar to [thias/puppet-fooacl](https://github.com/thias/puppet-fooacl) it builds a list of all the ACLs to apply to the system, and runs the script (instead of manaing each ACL as a unique resource).       

Managing ACLs like this is beneficial when dealing with a large amount of ACLs, and/or when you need things outside of Puppet to be able to easily apply or reference what ACLs are set. This script works by building a yaml file to track all the ACLs that should be present on a system, then runs them through a simple Ruby script (which uses the packaged version of Ruby that puppet-agent provides) to apply them to the system. Doing it this way vs a shell script or similar, reduces the amount of external resources or dependencies that are needed (e.g. shell version/type/etc).

## Setup

### Beginning with Posixacl

To include the module, simply call it in your manifest with `include ::posixacl`. See below for usage information on actually setting ACLs to be applied to the system.

## Usage

By default the module will only make sure the package(s) that provide ACL support are install, template out the script, and place an empty yaml file under `/etc/posixacls.yaml`.

To apply an ACL to an individual file or directory, you can use the `posixacl::acl` type, e.g.:

```
posixacl::acl { '/path/to/some/file':
  acl => 'u:someuser:r',
}
```

To apply the same ACL to a group of targets, you can use the `acl_lists` parameter, either directly or via hiera:

```
posixacl::acl_lists:
  mygroup_r-x:
    target:
      - /chroot/home/
      - /root/
      - /root/.my.cnf
      - /etc/anacrontab
      - /etc/crontab
      - /etc/proftpd.conf
      - /etc/cron.deny
    acl: 'group:mygroup:r-X'
    recurse: true
```

## Reference

See [REFERENCE.md](REFERENCE.md).

## Limitations

For list of currently supported operating systems and dependencies, see [metadata.json](metadata.json).
