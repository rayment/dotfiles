#!/usr/bin/env python3

#
# java.py
# Java header autogen.
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

print('/*')
print(' * ' + name)
print(' *')
print(' * Author       : ' + os.environ['AUTHOR'])
print(' * Date created : ' + date)
print(' */')
print()
print('public class ' + cname + ' {')
print()
print('\tpublic ' + cname + '() {')
print('\t\t')
print('\t}')
print()
print('}')

