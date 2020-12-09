#!/bin/bash
for i in {1..4}
do
	ip netns exec vn$i ip link set eth$i netns 1
	ip netns del vn$i
done
