I created iptables stend

This is stend consists of 3 Routers and 1 server Nginx

I bilded this stend from is Vagrand+Ansible

We have:inetRouter,centralRouter,inetRouter and inetServer

![image](https://github.com/tulamelkii/otus/assets/130311206/6e603cc6-5b5e-421f-9ea4-d390bba6de09)


target: learn to creatre for iptables rules

1)create knock connect

2)forward local port 80 to 8080
   
3)see this site  nginx localhost

![image](https://github.com/tulamelkii/otus/assets/130311206/6dbad1d8-354e-4569-a5bb-9ac28c2b106d)


Full install and commit [ReadME](https://github.com/tulamelkii/otus/blob/iptables/ReadME)

***
○ apt install iptables-persistent netfilter-persistent (this is need for save rules or reload)

○ netfilter-persistent start (start netfiler)

  netfilter-persistent reload
  
  netfilter-persistent save (save /vim/etc/iptables/rules.v4)


