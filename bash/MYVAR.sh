#!/bin/bash
#Script is to demo testing variable named MYVAR exists and if it is empty
# Use script to test if MYVAR inherits from parent process

[ -v MYVAR ] && echo "The variable MYVAR exists"
[ -v MYVAR ] || echo "The variable MYVAR does not exist"

[ -v MYVAR ] && [ -n MYVAR ] && echo "The variable MYVAR has data"
[ -v MYVAR ] && [ -z MYVAR ] && echo "The variable MYVAR is empty"
