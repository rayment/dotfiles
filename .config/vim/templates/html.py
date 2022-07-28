#!/usr/bin/env python3

#
# HTML.py
# HTML base file autogen.
#
# Author       : Finn Rayment <finn@rayment.fr>
# Date created : 21/09/2021
#

import datetime
import os
import sys

date = datetime.date.today().strftime('%d/%m/%Y')
name = os.path.basename(sys.argv[1])

print('<!DOCTYPE html>')
print('<!--')
print('\t' + name)
print()
print('\tAuthor       : ' + os.environ['AUTHOR'])
print('\tDate created : ' + date)
print('-->')
print('<html lang="en">')
print('\t<head>')
print('\t\t<meta charset="utf-8">')
print('\t\t<meta name="viewport" content="width=device-width,initial-scale=1.0">')
print('\t\t<meta name="robots" content="noindex,nofollow">')
print('\t\t<title>' + name + "</title>")
print('\t\t<!--link rel="icon" href="/favicon.png" sizes="32x32" type="image/png" /-->')
print('\t\t<!--link rel="stylesheet" type="text/css" href="style.css" /-->')
print('\t\t<!--script src="script.js"></script-->')
print('\t</head>')
print('\t<body>')
print('\t\t')
print('\t</body>')
print('</html>')

