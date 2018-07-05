#!/bin/bash

set -e

SECTION=$1
CONF_FILE=$2

[ "$SECTION" != "" ]
[ "$CONF_FILE" != "" ]
[ -r $CONF_FILE ]

params=$(awk -v target=$SECTION -F= \
  '/^\[/{ sect=$1; gsub("[][]", "", sect) } sect==target && \
  $1!="["sect"]" && $1 ~ /^[^#;]/{ print $1"="$2 }' \
  $CONF_FILE)

for p in $params
do
  echo $p
done

