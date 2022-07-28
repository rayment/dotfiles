#!/usr/bin/env python3

#
# latex.py
# LaTeX header autogen.
#
# Author       : Finn Rayment <finn@rayment.fr>
# Date created : 22/09/2021
#

import datetime
import os
import sys

date = datetime.date.today().strftime('%d/%m/%Y')
name = os.path.basename(sys.argv[1])

print('%')
print('% ' + name)
print('%')
print('% Author       : ' + os.environ['AUTHOR'])
print('% Date created : ' + date)
print('%')
print()
print('\\documentclass[english]{article}')
print()
print('\\usepackage[utf8]{inputenc}')
print('\\usepackage[T1]{fontenc}')
print('\\usepackage{babel}')
print()
print('\\usepackage{amsmath}')
print('\\usepackage{amssymb}')
print('\\usepackage{fancyhdr}')
print('\\usepackage[paper=a4paper]{geometry}')
print('\\usepackage{graphicx}')
print('\\usepackage{listings}')
print()
print('\\newcommand{\\minus}{\\scalebox{0.75}[1.0]{$-$}}')
print()
print('\\begin{document}')
print()
print('\\pagestyle{fancy}')
print('\\fancyhead{}')
print('\\fancyfoot{}')
print('\\fancyhead[L]{First \\textsc{LAST}}')
print('\\fancyhead[R]{\\thepage}')
print('\\begin{title}')
print('\\hfill')
print('\\hfill')
print('\\begin{center}')
print('\\LARGE\\textbf{Paper heading}')
print('\\end{center}')
print('\\begin{center}')
print('\\LARGE Date')
print('\\end{center}')
print('\\end{title}')
print()
print('%\\pagenumbering{gobble}')
print('\n\n')
print('\\end{document}')

