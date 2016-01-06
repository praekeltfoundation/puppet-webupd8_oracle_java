# == Class: webupd8_oracle_java
#
# Install Oracle Java for Ubuntu from the Web Upd8 PPA
# https://launchpad.net/~webupd8team/+archive/ubuntu/java
# NOTE: Installing this module means that you have accepted the Oracle license agreement
#
# === Parameters
#
# [*ensure*]
#   The ensure value for the package.
#
# [*version*]
#   The version of Java to install, e.g. '8' or '9'.
class webupd8_oracle_java (
  $ensure  = 'installed',
  $version = '8',
) {
  apt::ppa { 'ppa:webupd8team/java': }

  $package = "oracle-java${version}-installer"
  $responsefile = "/var/cache/debconf/${package}.preseed"

  file { $responsefile:
    content => "${package} shared/accepted-oracle-license-v1-1 select true",
    ensure  => present,
  }

  package { $package:
    ensure       => $ensure,
    responsefile => $responsefile,
    require      => [
      File[$responsefile],
      Apt::Ppa['ppa:webupd8team/java'],
      Class['apt::update'],
    ],
  }
}
