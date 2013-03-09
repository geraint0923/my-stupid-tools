IP_LOCAL=
GATEWAY=
ip tunnel add sit1 mode sit remote 59.66.4.50 local $IP_LOCAL
ifconfig sit1 up
ifconfig sit1 add 2001:da8:200:900e:0:5efe:$IP_LOCAL/64
ip route add 2001::/3 via 2001:da8:200:900e::1 metric 1
route add -net 59.66.0.0/16 gw $GATEWAY
route add -net 166.111.0.0/16 gw $GATEWAY
