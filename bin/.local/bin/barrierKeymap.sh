#!/bin/sh
setxkbmap -device `xinput list | grep "Virtual core XTEST keyboard" | sed -e 's/.\+=\([0-9]\+\).\+/\1/'` -layout de 
exit 0
