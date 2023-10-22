Stend Open Vpn

Target: 

1)Create tun and tap drivers for connect

2)Create easy-rsa

![image](https://github.com/tulamelkii/otus/assets/130311206/5b531897-3b39-4acc-bb30-77e34cad2ca7)



*- name: create pki dir
          stat:
            path: /etc/openvpn/pki/
          register: pki_dir
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
                chdir: /etc/openvpn/  
          when: not pki_dir.stat.exists

