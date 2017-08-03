# keepalived
Centos based keepalived

To build:

docker build -t keepalived .

Params:

VIP : Virtual IP address
ETH : Physical network interface name
PRI : Priority of the VIP - the highest priority wins and will mark that host as the master

Example run:

On the "master" docker host:

docker run -d \
--net=host --privileged=true \
-e VIP=192.168.1.150 \
-e ETH=eth0 \
-e PRI=200 \
keepalived

On the "slave" docker host:

docker run -d \
--net=host --privileged=true \
-e VIP=192.168.1.150 \
-e ETH=eth0 \
-e PRI=100 \
keepalived

To view the logs:

docker logs keepalived

The keepalived executable binary is wrapped up in a bash script that will trap SIGTERM events from the host so it will terminate gracefully and remove the VIP from the hosts NIC properly.

Enjoy!
