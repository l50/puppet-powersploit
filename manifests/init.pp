# == Class: debianfirefox
#
# This module is used to install firefox on a debian-based system.
# It will also replace the existing symlink for iceweasel if specified.
#
# === Parameters
#
# [version]
#   The version of firefox to install
#
# [tarball_destination]
#   The location to store the tarball once it's downloaded
#
# [install_location]
#   Where you want to install firefox to
#
# [link_location]
#   Name of symbolic link to associate with firefox
#
# [replace_weasel_symlink]
#   Specify the decision to replace the existing iceweasel symlink
#   associated with firefox on the system
#
# === Variables
#
# N/A
#
# === Examples
#
# class { 'debianfirefox':
#  version => '40.0.2',
#  tarball_destination => '/opt/firefox-$version.tar.bz2',
#  install_location => '/opt/firefox',
#  link_location => '/usr/bin/firefox',
#  replace_weasel_symlink => true,
# }
#
# class { 'debianfirefox':
#   version => '40.0.2',
#   tarball_destination => '/opt/firefox-$version.tar.bz2',
#   install_location => '/opt/firefox',
#   replace_weasel_symlink => false,
# }
#
# === Authors
#
# l50 <jayson.e.grace@gmail.com>
#
# === Copyright
#
# Copyright 2015 l50
#
class debianfirefox(
  $version='40.0.2',
  $tarball_destination="/opt/firefox-$version.tar.bz2",
  $install_location='/opt/firefox',
  $link_location='/usr/bin/firefox',
  $replace_weasel_symlink=true,
) {
  $download_link="http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/$version/linux-x86_64/en-US/firefox-$version.tar.bz2"

  exec { 'download_firefox':
    command => "/usr/bin/wget -q $download_link -O $tarball_destination",
    creates => "$tarball_destination",
    path    => ['/usr/bin', '/bin', '/sbin'],
  }

  exec { 'unzip_firefox':
    command => "/bin/tar -xvf $tarball_destination -C /opt",
    creates => "$install_location",
    path    => ['/usr/bin', '/bin', '/sbin'],
    require => [
      Exec['download_firefox'],
    ]
  }

# Remove existing iceweasel symlink
  if $replace_weasel_symlink {
    exec { 'delete_iceweasel_link':
      command => "/bin/rm -r $link_location",
      path    => ['/usr/bin', '/bin', '/sbin'],
    }
  }

  if $replace_weasel_symlink {
    exec { 'link_firefox':
      command => "/bin/ln -s $install_location/firefox $link_location",
      creates => "$link_location",
      path    => ['/usr/bin', '/bin', '/sbin'],
      require => [
        Exec['download_firefox'],
        Exec['unzip_firefox'],
        Exec['delete_iceweasel_link']
      ]
    }
  }
}
