#!/bin/bash
for i in {1..4}
do
	ip netns add vn$i
	ip netns exec vn$i ip link set lo up
	ip link set eth$i netns vn$i
	ip netns exec vn$i ip link set eth$i up
	ip netns exec vn$i ip addr add 10.0.$(expr $i - 1).2/24 dev eth$i 
	ip netns exec vn$i ifconfig eth$i multicast
	IFACE=eth$i
	ip netns exec vn$i tc qdisc del dev ${IFACE} root
	ip netns exec vn$i tc qdisc add dev ${IFACE} root handle 1:0 htb default 1
	ip netns exec vn$i tc class add dev ${IFACE} parent 1:0 classid 1:1 htb rate 1.5Mbit ceil 1.5Mbit
	ip netns exec vn$i tc filter add dev ${IFACE} parent 1:0 prio 1 protocol ip u32 match ip dport 520 0xffff flowid 1:1

	ip netns exec vn$i tc -s qdisc ls dev ${IFACE}
	ip netns exec vn$i tc -s class ls dev ${IFACE}
	ip netns exec vn$i tc -s filter ls dev ${IFACE}
done
