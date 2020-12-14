#!/bin/sh
for i in 1 2 3 4 
do 
	echo show route | birdcl -s /var/run/bird$i.ctl | wc -l
done
