#!/bin/bash

set -e

CONF_FILE=/etc/adpi.conf

parse_args ()
{
  I2C_DEV=$1
}

export_config ()
{
  for c in $1
  do
    eval config_$c
  done
}

export_gpio ()
{
  GPIO_DEV="/sys/bus/i2c/devices/${I2C_DEV}"
  CHIP=$(find ${GPIO_DEV}/gpio/gpiochip*/ -maxdepth 0)
  BASE=$(cat ${CHIP}/base)
  
  for i in $(seq $BASE $(($BASE + $config_channels - 1)))
  do
    echo $i > ${CHIP}/subsystem/export
    echo "out" > ${CHIP}/subsystem/gpio${i}/direction
  done
}

parse_args $@

[ "$CONF_FILE" != "" ]
[ -r $CONF_FILE ]

SECTIONS=$(/usr/lib/adpi-utils/parse_sections.sh $CONF_FILE)

for s in $SECTIONS
do
  params=$(/usr/lib/adpi-utils/parse_parameters.sh $s $CONF_FILE)
  for p in $params
  do
    if [ "gpio=0x$(echo $I2C_DEV | sed -e 's/^1-00//')" = "$p" ]
    then
      export_config "$params"
      export_gpio
      break
    fi
  done
done

