#!/bin/bash
#helloscript.sh

#OH SHIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIIII
echo -n "helb world" |sed -e "s/b/o/g" -e "s/l/ll/" -e "s/ol/orl/" |tr "h" "H"|tr "w" "W"|awk '{print $1 "\x20" $2 "\41"}'
