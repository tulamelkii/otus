# otus
I created iptables stend

This is stend consists of 3 Routers and 1 server Nginx

I bilded this stend from is Vagrand+Ansible

We have:inetRouter,centralRouter,inetRouter and inetServer

![image](https://github.com/tulamelkii/otus/assets/130311206/82bc1d27-2460-444f-b171-abab798267ed)

First step: We mast create route rules for this vm
********************************************config inetRouter*************************************
allow-hotplug eth0
iface eth0 inet dhcp

auto eth1
iface eth1 inet static
      address 192.168.255.13
      netmask 255.255.255.252
up ip route add 192.168.2.4/30 via 192.168.255.14 dev eth1
up ip route add 192.168.3.4/30 via 192.168.255.14 dev eth1 

auto eth2
iface eth2 inet static
      address 192.168.56.10
      netmask 255.255.255.0

