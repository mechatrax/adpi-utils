#!/bin/bash

set -e

CONF_FILE=$1

[ "$CONF_FILE" != "" ]
[ -r $CONF_FILE ]

sects=$(awk -F= '/^\[.*\]/{ gsub("[][]", "", $0); print $0}' $CONF_FILE)

for s in $sects
do
  echo $s
done

