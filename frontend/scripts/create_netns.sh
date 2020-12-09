#!/bin/bash
for i in {1..4}
do
	ip netns add vn$i
	ip netns exec vn$i ip link set lo up
	ip link set eth$i netns vn$i
	ip netns exec vn$i ip link set eth$i up
	ip netns exec vn$i ip addr add 10.0.$i.2/24 dev eth$i 
done
