#!/usr/bin/env python3

#
# shell.py
# POSIX shell header autogen.
#
# Author       : Finn Rayment <finn@rayment.fr>
# Date created : 05/07/2022
#

import datetime
import os
import sys

date = datetime.date.today().strftime('%d/%m/%Y')
name = os.path.basename(sys.argv[1])

print('#!/bin/sh')
print()
print('#')
print('# ' + name)
print('#')
print('# Author       : ' + os.environ['AUTHOR'])
print('# Date created : ' + date)
print('#')
print('\n')

