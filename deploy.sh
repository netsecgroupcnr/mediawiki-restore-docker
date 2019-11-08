#!/bin/bash

if [ "$#" != "1" ]; then
	echo "Usage: $0 <comment>"
	exit 0
fi

rm -rf www-data/ 2> /dev/null
rm -rf db-data/ 2> /dev/null
rm -rf db-init/ 2> /dev/null
rm -rf /tmp/input/ 2> /dev/null
mv input /tmp/input

git add .
git commit -m "$1"
git push origin master

mv /tmp/input/ .
