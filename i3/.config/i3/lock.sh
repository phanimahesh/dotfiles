#!/bin/sh
set -e
xset s off dpms 0 10 0
i3lock \
  --nofork \
  --ignore-empty-password \
  --show-failed-attempts \
  --color 4c7899
xset s off -dpms
