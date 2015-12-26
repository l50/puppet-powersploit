# Class: powersploit
# ===========================
#
# This module installs Powersploit, a very powerful post-exploitation tool
# against Windows targets.
#
# Parameters
# ----------
#
# * `install`
# The directory where you want to install discover
#
# Variables
# ----------
#
# N/A
#
# Examples
# --------
#
# @example
#
#  class { 'powersploit':
#      install_location => '/opt/PowerSploit',
#    }
#
# Authors
# -------
#
# l50 <jayson.e.grace@gmail.com>
#
# Copyright
# ---------
#
# Copyright 2015 l50
#
class powersploit(
  $install_location='/opt/PowerSploit'
) {

  vcsrepo { $install_location:
    ensure   => present,
    provider => git,
    source   => 'git://github.com/mattifestation/PowerSploit.git',
    require  => Class['git'],
    before   => [
      Exec['download_listener'],
      Exec['download_ps_encoder'],
    ],
  }

  # Get listener start script required by Powersploit to function
  exec { 'download_listener':
    command => "/usr/bin/wget -q https://raw.github.com/obscuresec/random/master/StartListener.py -O $install_location/StartListener.py",
    creates => "$install_location/StartListener.py",
    path    => ['/usr/bin', '/bin', '/sbin'],
  }

  # Set permissions on the Listener
  file { "$install_location/StartListener.py":
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => 0755,
    require => [
      Vcsrepo[$install_location],
      Exec['download_listener'],
    ],
  }

  exec { 'download_ps_encoder':
    command => "/usr/bin/wget -q https://raw.github.com/darkoperator/powershell_scripts/master/ps_encoder.py -O $install_location/ps_encoder.py",
    creates => "$install_location/ps_encoder.py",
    path    => ['/usr/bin', '/bin', '/sbin'],
  }

  file { "$install_location/ps_encoder.py":
    ensure  => present,
    owner   => root,
    group   => root,
    mode    => 0755,
    require => [
      Vcsrepo[$install_location],
      Exec['download_ps_encoder'],
    ],
  }
}
