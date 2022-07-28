#!/usr/bin/env python3

#
# cheader.py
# C/C++ header file autogen.
#
# Author       : Finn Rayment <finn@rayment.fr>
# Date created : 22/09/2021
#

import datetime
import os
import sys

date = datetime.date.today().strftime('%d/%m/%Y')
name = os.path.basename(sys.argv[1])

cname = os.path.splitext(name)[0]
ext = os.path.splitext(name)[1][1:]
define = 'FR_RAYMENT_' + cname.upper() + '_' + ext.upper()

print('/*')
print(' * ' + name)
print(' *')
print(' * Author       : ' + os.environ['AUTHOR'])
print(' * Date created : ' + date)
print(' */')
print()
print('#ifndef ' + define)
print('#define ' + define + ' 1')
print()
if ext.lower() == 'h':
    print('#ifdef __cplusplus')
    print('extern "C"')
    print('{')
    print('#endif /* __cplusplus */')
    print()
    print('#ifdef __cplusplus')
    print('}')
    print('#endif /* __cplusplus */')
    print()
print('#endif /* ' + define + ' */')

