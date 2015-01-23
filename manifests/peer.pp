# == Class: strongswan::peer
#
# Full description of class role here.
#
# === Parameters
#
# === Variables
#
# === Examples
#
#  class { 'strongswan::peer': }
#
class strongswan::peer (
  $conn_name,
  $ike            = undef,
  $esp            = undef,
  $keyexchange    = undef,
  $keyingtries    = undef,
  $ikelifetime    = undef,
  $lifetime       = undef,
  $margintime     = undef,
  $tfc            = undef,
  $closeaction    = undef,
  $dpdaction      = undef,
  $compress       = undef,
  $left,
  $leftcert,
  $leftkey,
  $leftkey_type,
  $leftid,
  $leftfirewall,
  $leftsendcert   = undef,
  $leftsubnet     = undef,
  $right,
  $rightauth,
  $rightid,
  $rightsendcert  = undef,
  $rightsubnet    = undef,
  $auto,
) inherits strongswan {
  strongswan::snippet::ipsec_conf { $conn_name:
    ensure  => present,
    content => template("${module_name}/peer/ipsec.conf.erb"),
  }

  concat::fragment { $conn_name:
    target  => $strongswan::ipsec_secrets,
    content => template("${module_name}/peer/ipsec.secrets.erb"),
  }
}
