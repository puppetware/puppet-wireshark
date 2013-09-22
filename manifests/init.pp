# == Class: wireshark
#
# Install Wireshark
#
# === Parameters:
#
# [*version*] Version of Wireshark to be installed
#
# === Examples
#
#  class { wireshark: }
#
# === Authors
#
# Ryan Skoblenick <ryan@skoblenick.com>
#
# === Copyright
#
# Copyright 2013 Ryan Skoblenick.
#
class wireshark (
  $version = $wireshark::params::version,
) inherits wireshark::params {
  anchor {'wireshark::begin': } ->
  class {'wireshark::install': } ->
  anchor {'wireshark::end': }
}