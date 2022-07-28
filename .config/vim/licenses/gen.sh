#!/bin/sh

# generate a new license set

#printf "License ID: "
#read id
#printf "This file is licensed under [...]: "
#read text

if [ -z "$1" ];
then
	exit 1
fi

id="$1"
text=$(cat ~/.config/vim/licenses/"$1".short)
ext=$(echo "$2" | tr '[:upper:]' '[:lower:]')

line1="This file is licensed under $text."
line2="All license information is available in the included COPYING file."

case "$ext" in
c|cpp|tpp|hpp|h|java|frag|vert|glsl|js|ld)
	echo "/*"
	echo " * $line1"
	echo " * $line2"
	echo " */"
	;;
py|asm|s|makefile|pl|rb|sh)
	echo "# $line1"
	echo "# $line2"
	;;
tex)
	echo "% $line1"
	echo "% $line2"
	;;
html)
	echo "<!--"
	echo "  $line1"
	echo "  $line2"
	echo " -->"
	;;
php)
	echo "<?php"
	echo "/*"
	echo " * $line1"
	echo " * $line2"
	echo " */"
	echo "?>"
	;;
*)
	echo "$line1"
	echo "$line2"
	;;
esac
echo ""

