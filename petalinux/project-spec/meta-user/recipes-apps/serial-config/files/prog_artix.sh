#!/bin/bash
prog_b_pin=960
init_b_pin=$(($prog_b_pin+1))
done_pin=$(($prog_b_pin+2))

[ -d /sys/class/gpio/gpio$prog_b_pin ] || echo $prog_b_pin >/sys/class/gpio/export 
[ -d /sys/class/gpio/gpio$init_b_pin ] || echo $init_b_pin >/sys/class/gpio/export 
[ -d /sys/class/gpio/gpio$done_pin ] || echo $done_pin >/sys/class/gpio/export 

echo out >/sys/class/gpio/gpio$prog_b_pin/direction

echo 0 >/sys/class/gpio/gpio$prog_b_pin/value
echo "init_b:" `cat /sys/class/gpio/gpio$init_b_pin/value`
echo 1 >/sys/class/gpio/gpio$prog_b_pin/value
echo "init_b:" `cat /sys/class/gpio/gpio$init_b_pin/value`

[ -f "$1" ] && time serial-config $1 

echo "init_b:" `cat /sys/class/gpio/gpio$init_b_pin/value`
echo "done:" `cat /sys/class/gpio/gpio$done_pin/value`
