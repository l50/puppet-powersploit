powersploit
===================


[![License](http://img.shields.io/:license-mit-blue.svg)](http://doge.mit-license.org)

#### Table of Contents

1. [Overview](#overview)
2. [Module Description - What the module does and why it is useful](#module-description)
3. [Setup - The basics of getting started with powersploit](#setup)
    * [Setup requirements](#setup-requirements)
    * [Beginning with powersploit](#beginning-with-powersploit)
4. [Usage - Configuration options and additional functionality](#usage)
5. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
5. [Limitations - OS compatibility, etc.](#limitations)
6. [Development - Guide for contributing to the module](#development)

## Overview

Used to install Powersploit

## Module Description

This module will install the Powersploit post exploitation tool

## Setup

### Setup Requirements

Both the git and stdlib puppet modules are required for this module to work
properly. Please add these to your Puppetfile like so:

```
mod 'puppetlabs/stdlib'
mod 'puppetlabs/git'
```

### Beginning with powersploit

Simply specify the directory you wish PowerSploit to be installed to as a parameter and run the module as you would any other.

## Usage
Install the PowerSploit tool to /opt/PowerSploit:
```
class { 'powersploit':
  install_location => '/opt/PowerSploit',
  }
```

## Limitations

This has been tested on Kali Linux, which is Debian based.

## Development

Feel free to fork this up and issue a pull request if you want to improve on the
work that has already been done.

## Release Notes/Contributors/Etc

Jayson Grace (l50) <jayson.e.grace@gmail.com>
