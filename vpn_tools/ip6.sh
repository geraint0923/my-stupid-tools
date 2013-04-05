#ip -6 route add 2001:da8:200:900e:10:5efe:59.66.133.36 dev br-lan
ifconfig br-lan 2001:da8:200:900e:10:5efe:3b42:8524/64
ip -6 route add  2001:da8:200:900e:10::/80 dev br-lan
radvd 
/root/dhcp.sh
#ip -6 route add 2001:da8:200:900e:10:5efe:59.66.133.36 dev br-lan
