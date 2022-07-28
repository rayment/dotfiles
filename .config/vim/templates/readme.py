#!/usr/bin/env python3

#
# readme.py
# README autogen.
#
# Author       : Finn Rayment <finn@rayment.fr>
# Date created : 28/07/2022
#

import os
import sys

name = os.path.basename(os.path.dirname(os.path.abspath(sys.argv[1])))

print(name + ' - description')
print()
print('---------------------------------------------------')
print()
print(name + ' is a ...')
print()
print('To build the documentation, read the DOCS file.')
print('To install ' + name + ' on a POSIX or POSIX-like machine,' +
      'read the INSTALL file.')
print('To install ' + name + ' on a Windows machine,' +
      'read the INSTALL.win file.')
print()
print(name + ' is licensed under ...')
print('All license information is available in the included COPYING file.')

