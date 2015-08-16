# debianfirefox

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with debianfirefox](#setup)
    * [What debianfirefox affects](#what-debianfirefox-affects)
    * [Beginning with debianfirefox](#beginning-with-debianfirefox)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Used to add Firefox to a Debian system.

## Module Description

This module will install Firefox on a Debian machine and can replace the existing
"firefox" symbolic link that is associated with Iceweasel.

## Setup

### What debianfirefox affects

* Iceweasel
* Firefox

### Beginning with debianfirefox

Look up the specific version of firefox you want to install.
Specify this along with the other required parameters in a hiera file or
params.pp file.

## Usage

class { 'debianfirefox':
  version => '40.0.2',
  tarball_destination => '/opt/firefox-$version.tar.bz2',
  install_location => '/opt/firefox',
  link_location => '/usr/bin/firefox',
  replace_weasel_symlink => true,
}

 class { 'debianfirefox':
   version => '40.0.2',
   tarball_destination => '/opt/firefox-$version.tar.bz2',
   install_location => '/opt/firefox',
   replace_weasel_symlink => false,
 }

## Limitations

This has been built to work with Debian and Debian only.

## Development

Feel free to fork this up and issue a pull request if you want to improve on the
work that has already been done.

## Release Notes/Contributors/Etc

Jayson Grace (l50) <jayson.e.grace@gmail.com>
