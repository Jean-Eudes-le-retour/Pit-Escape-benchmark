#!/bin/bash

trap "
if [ \$? -eq 0 ]; then
    exit 1
else
    exit 0
fi
" 0

python3 pit_escape.py
