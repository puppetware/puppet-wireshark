# == Class: wireshark::install
#
# Install Wireshark
#
# === Authors
#
# Ryan Skoblenick <ryan@skoblenick.com>
#
# === Copyright
#
# Copyright 2013 Ryan Skoblenick.
#
class wireshark::install {
  $version = $wireshark::version

  $arch = $::architecture ? {
    /(x86_64|amd64)/ => '64',
    /(i386|x86)/ => '32',
    default => fail("Unrecognized architecture: ${::architecture}")
  }

  $source = $::kernel ? {
    'Darwin' => "http://wiresharkdownloads.riverbed.com/wireshark/osx/Wireshark%20${version}%20Intel%20${arch}.dmg",
    default => fail("Unsupported Kernel: ${::kernel} operatingsystem: ${::operatingsystem}")
  }

  package {"wireshark-${version}":
    ensure => installed,
    source => $source,
    provider => pkgdmg,
  }
}