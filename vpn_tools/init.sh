#/root/ipv6.sh

#/root/sclient
route delete -net 0.0.0.0/0 gw 59.66.133.1
route add default dev tun0

/root/route_config.sh
