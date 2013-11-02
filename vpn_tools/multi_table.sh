#/etc/iproute2/rt_tables
ip rule add from <source>/<mask> table <name>
ip route add 1.2.3.4/24 table <name> dev eth4
