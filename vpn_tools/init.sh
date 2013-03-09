#/root/ipv6.sh

GATEWAY=
#/root/sclient
route delete -net 0.0.0.0/0 gw $GATEWAY
route add default dev tun0

/root/route_config.sh
