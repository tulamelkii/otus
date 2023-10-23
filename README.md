Stend Open Vpn

Target: 

1)Create tun and tap drivers for connect OpenVpn 

2)Create easy-rsa

Full install and commit [ReadME](https://github.com/tulamelkii/otus/blob/Vpn/Read)

![image](https://github.com/tulamelkii/otus/assets/130311206/5b531897-3b39-4acc-bb30-77e34cad2ca7)


conclusion:

tap                                                                                                

[ ID]     Interval         Transfer     Bitrate      Retr                                       

[  5]   0.00-40.00  sec   771 MBytes   162 Mbits/sec  355      sender  
 
[  5]   0.00-40.04  sec   769 MBytes   161 Mbits/sec          receiver                       

tun

[ ID]     Interval         Transfer     Bitrate       Retr

[  5]   0.00-40.00  sec   784 MBytes   164 Mbits/sec  206      sender

[  5]   0.00-40.08  sec   783 MBytes   164 Mbits/sec          receiver



this is two differences metods: 


1) tun transfer mor then tap (tun 783 Mbits > tap 771 Mbits)
   
2) tun better by speed Bitrate ( 164 Mbits > 162 Mbits)
   
4) Tun less retry 206 < 355
   
5) but if we comapre interval tap take the test 40.4 and tun 40.8 and if we try simmillar interval, this is values may be was idential



-TUN devices work at the IP level and they operate with Layer 3 packets (IP packets).

-TUN encapsulate the IP packets inside the VPN protocol

-TUN is used with routing

-TAP devices work at the Ethernet (MAC) level and work Laers 2

-TAP encapsulate the Ethernet frames inside the VPN 

-TAP is used with Ethernet bridging

A lot of piple use TUN metod,TAP - very specific, if he work only two liers

TUN is generally used more because it tends to meet the requirements for most VPN users,  TAP is used for more specific situations where you need to bridge networks at the Ethernet level.
 



        - name: create pki dir 
          stat:                     
            path: /etc/openvpn/pki/
          register: pki_dir        #create new var
        - name: comand with pki
          block:
            - name: check folder and init pki
              shell: |
                /usr/share/easy-rsa/easyrsa init-pki
                echo 'rasvpn' | /usr/share/easy-rsa/easyrsa build-ca nopass
                echo 'rasvpn' | /usr/share/easy-rsa/easyrsa gen-req server nopass
                echo 'yes' | /usr/share/easy-rsa/easyrsa sign-req server server
                /usr/share/easy-rsa/easyrsa gen-dh
                echo 'client' | /usr/share/easy-rsa/easyrsa gen-req client nopass
                echo 'yes' | /usr/share/easy-rsa/easyrsa sign-req client client
              args:
                chdir: /etc/openvpn/     # play with folder
          when: not pki_dir.stat.exists  # pki_dir-register: pki_dir ; stat-modul ; exists - Return Values (with module stat)

    
*This is module checking: if not folder pki here then run commands else if folder here then skip block
 
