#!/usr/bin/env python3

#
# php.py
# PHP header autogen.
#
# Author       : Finn Rayment <finn@rayment.fr>
# Date created : 21/09/2021
#

import datetime
import os
import sys

date = datetime.date.today().strftime('%d/%m/%Y')
name = os.path.basename(sys.argv[1])

print('<?php')
print('/*')
print(' * ' + name)
print(' *')
print(' * Author       : ' + os.environ['AUTHOR'])
print(' * Date created : ' + date)
print(' */')
print('\n\n')
print('?>')

