#!/bin/bash

tmpbg=/tmp/screenshot.png

scrot $tmpbg
convert $tmpbg -scale 10% -scale 1000% $tmpbg
i3lock -u -i $tmpbg
